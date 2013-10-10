//  ____ ____ ____ ____ ____ ____ ____ ____
// ||D |||i |||v |||e |||r |||t |||a |||p ||
// ||__|||__|||__|||__|||__|||__|||__|||__||
// |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
//
//  Copyright Divertap 2013. All rights reserved.

#import <objc/runtime.h>
#import "jsapi.h"
#import "js_bindings_NS_manual.h"

typedef enum GamedoniaKeyType_ {
    kGamedoniaKeyTypeDevelopersNormal = 0,
    kGamedoniaKeyTypeDevelopersMaster = 1,
    kGamedoniaKeyTypeProductionNormal = 2,
    kGamedoniaKeyTypeProductionMaster = 3
} GamedoniaKeyType;

typedef void (^js_gamedonia_result_block)(BOOL result);
typedef void (^js_gamedonia_result_with_data_block)(BOOL result, NSObject* p0);

#define kGamedoniaApiVersion @"v1"
#define kGamedoniaApiServerURL @"http://api.gamedonia.com"

#define kGamedoniaKeyDevelopersNormal @"e5a7ce9d-b5db-4ea6-8a01-23075ad79f51"
#define kGamedoniaGameSecret @"0e60d67d40d6181eaa9dae9fd2ef723d"

@interface JSB_NSError : JSB_NSObject
{
}
@end

#ifdef __cplusplus
extern "C" {
#endif
	void JSB_NSError_createClass(JSContext* cx, JSObject* globalObj, const char * name );
	extern JSObject* JSB_NSError_object;
	extern JSClass* JSB_NSError_class;
	
#ifdef __cplusplus
}
#endif

@interface JSB_NSDictionary : JSB_NSObject
{
}
@end

#ifdef __cplusplus
extern "C" {
#endif
	void JSB_NSDictionary_createClass(JSContext* cx, JSObject* globalObj, const char * name );
	extern JSObject* JSB_NSDictionary_object;
	extern JSClass* JSB_NSDictionary_class;
	
#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

	// Initializes Gamedonia engine
	JSBool JSBGamedoniaCore_initGamedonia(JSContext *cx, uint32_t argc, jsval *vp);
    // Initializes Gamedonia Request engine
	JSBool JSBGamedoniaCore_initRequest(JSContext *cx, uint32_t argc, jsval *vp);
    // Factory method
    JSBool JSBGamedoniaCore_createUserWithEmailAndPassword(JSContext *cx, uint32_t argc, jsval *vp);
    JSBool JSBGamedoniaCore_createUserWithOpenUDID(JSContext *cx, uint32_t argc, jsval *vp);
    JSBool JSBGamedoniaCore_createUserWithFacebookId(JSContext *cx, uint32_t argc, jsval *vp);
    JSBool JSBGamedoniaCore_createUserWithGameCenterId(JSContext *cx, uint32_t argc, jsval *vp);
    JSBool JSBGamedoniaCore_createGDDeviceProfile(JSContext *cx, uint32_t argc, jsval *vp);

#ifdef __cplusplus
}
#endif


JSBool jsval_to_gamedonia_result_block_1( JSContext *cx, jsval vp, JSObject *jsthis, js_gamedonia_result_block *ret);
JSBool jsval_to_gamedonia_result_block_2( JSContext *cx, jsval vp, JSObject *jsthis, js_gamedonia_result_with_data_block *ret);