//  ____ ____ ____ ____ ____ ____ ____ ____
// ||D |||i |||v |||e |||r |||t |||a |||p ||
// ||__|||__|||__|||__|||__|||__|||__|||__||
// |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
//
//  Copyright Divertap 2013. All rights reserved.

#import "jsapi.h"
#import "js_bindings_config.h"
#import "js_bindings_core.h"
#import "js_bindings_Gamedonia_core.h"
#import "js_bindings_Gamedonia_classes.h"
#import "js_bindings_Gamedonia_registration.h"

void jsb_register_Gamedonia( JSContext *_cx, JSObject *object) {
    //
	// gamedonia
	//
	JSObject *gamedonia = JS_NewObject(_cx, NULL, NULL, NULL);
	jsval gamedoniaVal = OBJECT_TO_JSVAL(gamedonia);
	JS_SetProperty(_cx, object, "gd", &gamedoniaVal);
    
    // Basic functions
    JS_DefineFunction(_cx, gamedonia, "initGamedonia", JSBGamedoniaCore_initGamedonia, 1, JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_ENUMERATE );
    JS_DefineFunction(_cx, gamedonia, "initRequest", JSBGamedoniaCore_initRequest, 1, JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_ENUMERATE );
    JS_DefineFunction(_cx, gamedonia, "createUserWithEmailAndPassword", JSBGamedoniaCore_createUserWithEmailAndPassword, 2, JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_ENUMERATE );
    JS_DefineFunction(_cx, gamedonia, "createUserWithOpenUDID", JSBGamedoniaCore_createUserWithOpenUDID, 1, JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_ENUMERATE );
    JS_DefineFunction(_cx, gamedonia, "createUserWithGameCenterId", JSBGamedoniaCore_createUserWithGameCenterId, 1, JSPROP_READONLY | JSPROP_PERMANENT | JSPROP_ENUMERATE );
    
    // Supported types
    // NSMutableDictionary (limited dictionary functionality)
    JSB_NSDictionary_createClass(_cx, gamedonia, "Dictionary");
    // NSError
    JSB_NSError_createClass(_cx, gamedonia, "Error");
    
    JSObject *Gamedonia = gamedonia;
  
#import "js_bindings_Gamedonia_classes_registration.h"
}
