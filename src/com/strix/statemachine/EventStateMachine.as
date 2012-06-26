package com.strix.statemachine {
    
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    
    public final class EventStateMachine {
        
        public static const
            INVALID_TRANSITION : Boolean = false;
            
        private var
            currentState : String;
        
            
        public function EventStateMachine( initialState : String ) {
            currentState = initialState;
        }
        
        public function add(
            from:String,
            to:String,
            eventDispatcher:EventDispatcher,
            onEvent:Event,
            actionFilter:Function ) : EventStateMachine {

            eventDispatcher.addEventListener(
                onEvent.type,
                function( ... Arguments ) : void {
                    if( currentState == from ) {
                        if( actionFilter != null && actionFilter.apply(null, Arguments) == EventStateMachine.INVALID_TRANSITION )
                            return;
                        
                        currentState = to;
                    }
                }
            );
            
            return this;
        }
        
        
        public function get state() : String {
            return currentState;
        }

    }
    
}