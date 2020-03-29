package com.reactnativebubbleselect

import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class BubbleSelectNodeViewManager: SimpleViewManager<BubbleSelectNodeView>() {
  override fun getName(): String {
    return "RNBubbleSelectNodeView"
  }

  override fun createViewInstance(reactContext: ThemedReactContext): BubbleSelectNodeView {
    return BubbleSelectNodeView(reactContext)
  }

  @ReactProp(name = "text")
  fun setText(view: BubbleSelectNodeView, text: String?) {
    if (text == null) return
    view.text = text
  }

  @ReactProp(name = "id")
  fun setId(view: BubbleSelectNodeView, id: String?) {
    if (id == null) return
    view.id = id
  }

  @ReactProp(name = "fontFamily")
  fun setFontFamily(view: BubbleSelectNodeView, fontFamily: String?) {
    view.fontFamily = fontFamily
  }

  @ReactProp(name = "fontStyle")
  fun setFontStyle(view: BubbleSelectNodeView, fontStyle: String?) {
    view.run { setFontStyle(fontStyle) }
  }

  @ReactProp(name = "fontColor")
  fun setFontColor(view: BubbleSelectNodeView, fontColor: String?) {
    view.fontColor = fontColor
  }

  @ReactProp(name = "color")
  fun setColor(view: BubbleSelectNodeView, color: String?) {
    view.color = color
  }
}
