package com.reactnativebubbleselect

import android.graphics.Typeface
import android.widget.LinearLayout
import com.facebook.react.bridge.ReactContext

class BubbleSelectNodeView(context: ReactContext): LinearLayout(context) {
  lateinit var id: String
  lateinit var text: String
  var fontFamily: String? = null
  var fontStyle: Int = Typeface.NORMAL
  var fontSize: Float = 14f
  var fontColor: String? = null
  var color: String? = null

  init {
    inflate(context, R.layout.bubble_node, this)
  }

  fun setFontStyle(style: String?) {
    fontStyle = when (style) {
      "bold-italic" -> Typeface.BOLD_ITALIC
      "italic" -> Typeface.ITALIC
      "bold" -> Typeface.BOLD
      else -> Typeface.NORMAL
    }
  }
}
