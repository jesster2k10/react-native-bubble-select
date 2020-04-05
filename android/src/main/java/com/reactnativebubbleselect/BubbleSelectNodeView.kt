package com.reactnativebubbleselect

import android.graphics.Color
import android.graphics.Typeface
import android.widget.LinearLayout
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReadableMap
import com.igalata.bubblepicker.model.BubbleGradient

class BubbleSelectNodeView(context: ReactContext): LinearLayout(context) {
  lateinit var id: String
  lateinit var text: String
  var fontFamily: String? = null
  var fontStyle: Int = Typeface.NORMAL
  var fontSize: Float = 14f
  var fontColor: String = "#ffffff"
  var color: String? = null
  var gradient: ReadableMap? = null

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

  fun getGradient(): BubbleGradient? {
    val mGradient = this.gradient;
    if (mGradient === null) {
      return null
    }

    val startColor = mGradient.getString("startColor");
    val endColor = mGradient.getString("endColor");
    val direction = when (mGradient.getString("direction")) {
      "horizontal" -> BubbleGradient.HORIZONTAL
      else -> BubbleGradient.VERTICAL
    }

    if (startColor === null || endColor === null) {
      return null
    }

    return BubbleGradient(
      Color.parseColor(startColor),
      Color.parseColor(endColor),
      direction
    )
  }
}
