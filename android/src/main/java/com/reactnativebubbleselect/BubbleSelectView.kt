package com.reactnativebubbleselect

import android.graphics.Color
import android.graphics.Typeface
import android.widget.FrameLayout
import com.facebook.react.bridge.LifecycleEventListener
import com.facebook.react.bridge.ReactContext
import com.facebook.react.uimanager.UIManagerModule
import com.facebook.react.uimanager.events.RCTEventEmitter
import com.igalata.bubblepicker.adapter.BubblePickerAdapter
import com.igalata.bubblepicker.model.BubbleGradient
import com.igalata.bubblepicker.model.PickerItem
import com.igalata.bubblepicker.rendering.BubblePicker
import com.igalata.bubblepicker.BubblePickerListener

class BubbleSelectView(context: ReactContext): FrameLayout(context), LifecycleEventListener, BubblePickerListener {
  val bubblePicker: BubblePicker
  val nodes: ArrayList<BubbleSelectNodeView> = ArrayList()

  init {
    inflate(context, R.layout.bubble_view, this)
    bubblePicker = findViewById(R.id.bubble_picker);
    bubblePicker.listener = this;
    bubblePicker.maxSelectedCount = 10000
    context.addLifecycleEventListener(this);
    setupBubblePickerAdapter()
  }

  private fun setupBubblePickerAdapter() {
    bubblePicker.adapter = object : BubblePickerAdapter {
      override val totalCount: Int = nodes.size

      override fun getItem(position: Int): PickerItem {
        return PickerItem().apply {
          val node = nodes[position]
          title = node.text
          id = node.id
          if (node.fontFamily !== null) {
            typeface = Typeface.create(node.fontFamily, node.fontStyle)
          }
          textColor = Color.parseColor(node.fontColor)

          if (node.gradient !== null) {
            gradient = node.getGradient();
          } else if (node.color !== null) {
            gradient = BubbleGradient(
              Color.parseColor(node.color),
              Color.parseColor(node.color),
              BubbleGradient.VERTICAL
            )
          }
        }
      }
    }
  }

  fun addNode(node: BubbleSelectNodeView) {
    nodes.add(node)
    bubblePicker.addedItem(nodes.size - 1)
  }

//  fun removeNode(node: BubbleSelectNodeView) {
//    nodes.remove(node)
//    setupBubblePickerAdapter()
//  }

  override fun onHostPause() {
    bubblePicker.onPause()
  }

  override fun onHostResume() {
    bubblePicker.onResume()
  }

  override fun onHostDestroy() {}

  private fun findNode(item: PickerItem): BubbleSelectNodeView? {
    return nodes.find {
      it.id == item.id
    }
  }

  override fun onBubbleDeselected(item: PickerItem) {
    val node = findNode(item) ?: return
    val event = BubbleDeselectNodeEvent(id)
    event.node = node

    val reactContext = context as ReactContext
    reactContext.getNativeModule(UIManagerModule::class.java).eventDispatcher.dispatchEvent(event)
  }

  override fun onBubbleSelected(item: PickerItem) {
    val node = findNode(item) ?: return
    val event = BubbleSelectNodeEvent(id)
    event.node = node

    val reactContext = context as ReactContext
    reactContext.getNativeModule(UIManagerModule::class.java).eventDispatcher.dispatchEvent(event)
  }

  override fun onBubbleRemoved(item: PickerItem) {
    val node = findNode(item) ?: return
    val event = BubbleRemoveNodeEvent(id)
    event.item = node

    val reactContext = context as ReactContext
    reactContext.getNativeModule(UIManagerModule::class.java).eventDispatcher.dispatchEvent(event)
  }
}
