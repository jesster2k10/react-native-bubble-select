package com.reactnativebubbleselect

import com.facebook.react.bridge.Arguments
import com.facebook.react.uimanager.events.Event
import com.facebook.react.uimanager.events.RCTEventEmitter

class BubbleRemoveNodeEvent(viewId: Int): Event<BubbleRemoveNodeEvent>(viewId) {
  companion object {
    var EVENT_NAME = "onRemoveNode"
  }

  lateinit var item: BubbleSelectNodeView

  override fun getEventName(): String {
    return EVENT_NAME;
  }

  override fun getCoalescingKey(): Short {
    return 0
  }

  override fun canCoalesce(): Boolean {
    return false
  }

  override fun dispatch(rctEventEmitter: RCTEventEmitter?) {
    val eventData = Arguments.createMap()
    eventData.putString("id", item.id)
    eventData.putString("text", item.text)
    eventData.putInt("target", viewTag)

    rctEventEmitter?.receiveEvent(viewTag, eventName, eventData)
  }
}
