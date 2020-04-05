package com.reactnativebubbleselect

import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.view.View
import com.facebook.react.common.MapBuilder
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.facebook.react.uimanager.annotations.ReactProp

class BubbleSelectViewManager: ViewGroupManager<BubbleSelectView>() {
  override fun getName(): String {
    return "RNBubbleSelectView"
  }

  override fun createViewInstance(reactContext: ThemedReactContext): BubbleSelectView {
    return BubbleSelectView(reactContext)
  }

  @ReactProp(name = "allowsMultipleSelection")
  fun setAllowsMultipleSelection(view: BubbleSelectView, allowsMultipleSelection: Boolean? = true) {
    if (allowsMultipleSelection == null) return
    if (allowsMultipleSelection) {
      view.bubblePicker.maxSelectedCount = null
    } else {
      view.bubblePicker.maxSelectedCount = 1
    }
  }

  @ReactProp(name = "bubbleSize")
  fun setBubbleSize(view: BubbleSelectView, size: Int?) {
    if (size == null) return
    view.bubblePicker.bubbleSize = size
  }

  @ReactProp(name = "backgroundColor")
  fun setBackgroundColor(view: BubbleSelectView, color: String?) {
    if (color == null) return
    view.background = ColorDrawable(Color.parseColor(color))
  }

  override fun addView(parent: BubbleSelectView?, child: View?, index: Int) {
    if (child is BubbleSelectNodeView && parent !== null) {
      parent.addNode(child)
    }
  }

  override fun removeView(parent: BubbleSelectView?, child: View?) {
    if (child is BubbleSelectNodeView  && parent !== null) {
      parent.removeNode(child)
    }
  }

  override fun getExportedCustomDirectEventTypeConstants(): MutableMap<String, Any> {
    return MapBuilder.of(
      BubbleSelectNodeEvent.EVENT_NAME, MapBuilder.of(
        "registrationName", "onSelectNode"
      ),
      BubbleDeselectNodeEvent.EVENT_NAME, MapBuilder.of(
        "registrationName", "onDeselectNode"
      )
    )
  }

}
