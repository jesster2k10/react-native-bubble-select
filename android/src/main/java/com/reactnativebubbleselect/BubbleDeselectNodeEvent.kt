package com.reactnativebubbleselect

import com.facebook.react.bridge.Arguments
import com.facebook.react.uimanager.events.Event
import com.facebook.react.uimanager.events.RCTEventEmitter

class BubbleDeselectNodeEvent: Event<BubbleDeselectNodeEvent>() {
  companion object {
    const val EVENT_NAME = "onDeselectNode"
  }

  lateinit var node: BubbleSelectNodeView

  override fun getEventName(): String {
    return EVENT_NAME
  }

  override fun getCoalescingKey(): Short {
    return  0
  }

  override fun canCoalesce(): Boolean {
    return false
  }

  override fun dispatch(rctEventEmitter: RCTEventEmitter?) {
    val eventData = Arguments.createMap()
    eventData.putString("text", node.text)
    eventData.putString("id", node.id)
    eventData.putInt("target", viewTag)

    rctEventEmitter?.receiveEvent(viewTag, eventName, eventData)
  }
}
