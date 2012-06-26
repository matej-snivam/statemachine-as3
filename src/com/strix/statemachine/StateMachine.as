package com.strix.statemachine {

    public final class StateMachine {
        
        public static const
            INVALID_TRANSITION : Boolean = false;
            
        private var
            currentState  : String,
            actionFilters : Array;
        
            
        public function StateMachine( initialState : String ) {
            currentState = initialState;
            actionFilters = new Array;
        }
        
        
        public function add( from:String, to:String, actionFilter:Function ) : StateMachine {
            actionFilters[from+to] = actionFilter;
            
            return this;
        }
        
        
        public function get state() : String {
            return currentState;
        }
        
        
        public function set state( newState:String ) : void {
            var actionFilter : Function = actionFilters[currentState+newState];
            
            if( actionFilter == null ) {
                return;
            }
            
            if( actionFilter.apply(null) == EventStateMachine.INVALID_TRANSITION ) {
                return;
            }
            
            currentState = newState;
        }

    }
    
}