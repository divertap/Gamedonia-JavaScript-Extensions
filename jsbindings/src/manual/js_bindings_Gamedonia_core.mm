//  ____ ____ ____ ____ ____ ____ ____ ____
// ||D |||i |||v |||e |||r |||t |||a |||p ||
// ||__|||__|||__|||__|||__|||__|||__|||__||
// |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
//
//  Copyright Divertap 2013. All rights reserved.

#import "js_bindings_config.h"
#import "js_bindings_core.h"
#import "js_bindings_Gamedonia_core.h"

// Gamedonia
#import "OpenUDID.h"
#import "Gamedonia.h"
#import "GDSessionToken.h"
#import "GDUser.h"

#pragma mark - NSError

JSClass* JSB_NSError_class = NULL;
JSObject* JSB_NSError_object = NULL;

// Constructor
JSBool JSB_NSError_constructor(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSObject *jsobj = JS_NewObject(cx, JSB_NSError_class, JSB_NSError_object, NULL);
	
    JSB_NSError *proxy = [[JSB_NSError alloc] initWithJSObject:jsobj class:[NSError class]];
	
	jsb_set_proxy_for_jsobject(proxy, jsobj);
    JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	
    /* no callbacks */
    
    return JS_TRUE;
}

// Methods
JSBool JSB_NSError_description(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	NSError* real = (NSError*) [proxy realObj];
	jsval ret = NSString_to_jsval(cx,[real description]);
	
	JS_SET_RVAL(cx, vp, ret);
	return JS_TRUE;
}

JSBool JSB_NSError_domain(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	NSError* real = (NSError*) [proxy realObj];
	jsval ret = NSString_to_jsval(cx,[real domain]);
	
	JS_SET_RVAL(cx, vp, ret);
	return JS_TRUE;
}

JSBool JSB_NSError_code(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	NSError* real = (NSError*) [proxy realObj];
	jsval ret = int_to_jsval(cx,[real code]);
	
	JS_SET_RVAL(cx, vp, ret);
	return JS_TRUE;
}

JSBool JSB_NSError_userInfo(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	NSError* real = (NSError*) [proxy realObj];
    
	jsval ret = NSDictionary_to_jsval(cx, [real userInfo]);
	
	JS_SET_RVAL(cx, vp, ret);
	return JS_TRUE;
}


// Destructor
void JSB_NSError_finalize(JSFreeOp *fop, JSObject *obj)
{
	CCLOGINFO(@"jsbindings: finalizing JS object %p (NSError)", obj);
    
	jsb_del_proxy_for_jsobject( obj );
}

void JSB_NSError_createClass(JSContext* cx, JSObject* globalObj, const char *name )
{
	JSB_NSError_class = (JSClass *)calloc(1, sizeof(JSClass));
	JSB_NSError_class->name = name;
	JSB_NSError_class->addProperty = JS_PropertyStub;
	JSB_NSError_class->delProperty = JS_PropertyStub;
	JSB_NSError_class->getProperty = JS_PropertyStub;
	JSB_NSError_class->setProperty = JS_StrictPropertyStub;
	JSB_NSError_class->enumerate = JS_EnumerateStub;
	JSB_NSError_class->resolve = JS_ResolveStub;
	JSB_NSError_class->convert = JS_ConvertStub;
	JSB_NSError_class->finalize = JSB_NSError_finalize;
	JSB_NSError_class->flags = 0;
	
	static JSPropertySpec properties[] = {
		{0, 0, 0, 0, 0}
	};
	
	
	static JSFunctionSpec funcs[] = {
		JS_FN("getDomain", JSB_NSError_domain, 0, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("getCode", JSB_NSError_code, 0, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("getDescription", JSB_NSError_description, 0, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("getUserInfo", JSB_NSError_userInfo, 0, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
		JS_FS_END
	};
	
	static JSFunctionSpec st_funcs[] = {
		JS_FS_END
	};
	
	JSB_NSError_object = JS_InitClass(cx, globalObj, JSB_NSObject_object, JSB_NSError_class, JSB_NSError_constructor,0,properties,funcs,NULL,st_funcs);
	JSBool found;
	JS_SetPropertyAttributes(cx, globalObj, name, JSPROP_ENUMERATE | JSPROP_READONLY, &found);
}

@implementation JSB_NSError

+(JSObject*) createJSObjectWithRealObject:(id)realObj context:(JSContext*)cx
{
	JSObject *jsobj = JS_NewObject(cx, JSB_NSError_class, JSB_NSError_object, NULL);
    JSB_NSError *proxy = [[JSB_NSError alloc] initWithJSObject:jsobj class:[NSError class]];
	
	[proxy setRealObj:realObj];
    
	if( realObj ) {
		objc_setAssociatedObject(realObj, &JSB_association_proxy_key, proxy, OBJC_ASSOCIATION_RETAIN);
		[proxy release];
	}
	
	[self swizzleMethods];
	
	return jsobj;
}
@end

#pragma mark - NSDictionary

JSClass* JSB_NSDictionary_class = NULL;
JSObject* JSB_NSDictionary_object = NULL;

// Constructor
JSBool JSB_NSDictionary_constructor(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSObject *jsobj = JS_NewObject(cx, JSB_NSDictionary_class, JSB_NSDictionary_object, NULL);
	
    JSB_NSDictionary *proxy = [[JSB_NSDictionary alloc] initWithJSObject:jsobj class:[NSMutableDictionary class]];
	
	jsb_set_proxy_for_jsobject(proxy, jsobj);
    JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	
    /* no callbacks */
    
    return JS_TRUE;
}

// Methods
JSBool JSB_NSDictionary_setString_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 2, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    
    NSString *object;
    NSString *key;
    
    ok &= jsval_to_NSString(cx, argvp[0], &object);
    ok &= jsval_to_NSString(cx, argvp[1], &key);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    [real setObject:object forKey:key];
	
	return JS_TRUE;
}

JSBool jsval_to_NSStringArray( JSContext *cx, jsval vp, NSArray**ret )
{
	// Parsing sequence
	JSObject *jsobj;
	JSBool ok = JS_ValueToObject( cx, vp, &jsobj );
	JSB_PRECONDITION3( ok, cx, JS_FALSE, "Error converting value to object");
	
	JSB_PRECONDITION3( jsobj && JS_IsArrayObject( cx, jsobj),  cx, JS_FALSE, "Object must be an array");
    
	
	uint32_t len;
	JS_GetArrayLength(cx, jsobj,&len);
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:len];
	for( uint32_t i=0; i< len;i++ ) {
		jsval valarg;
		JS_GetElement(cx, jsobj, i, &valarg);
		
		// XXX: forcing them to be objects, but they could also be NSString, NSDictionary or NSArray
		NSString *real_obj;
		ok = jsval_is_NSString( cx, valarg, &real_obj );
		JSB_PRECONDITION3( ok, cx, JS_FALSE, "Error converting value to nsstring");
		
		[array addObject:real_obj];
	}
	*ret = array;
    
	return JS_TRUE;
}

JSBool JSB_NSDictionary_setArray_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 2, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    
    NSArray *object;
    NSString *key;
    
    ok &= jsval_to_NSStringArray(cx, argvp[0], &object);
    ok &= jsval_to_NSString(cx, argvp[1], &key);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    [real setObject:object forKey:key];
	
	return JS_TRUE;
}

JSBool JSB_NSDictionary_setInteger_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 2, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    
    int object;
    NSString *key;
    
    ok &= jsval_to_int(cx, argvp[0], &object);
    ok &= jsval_to_NSString(cx, argvp[1], &key);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    [real setObject:@(object) forKey:key];
	
	return JS_TRUE;
}

JSBool JSB_NSDictionary_setDictionary_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 2, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    JSObject *js_dict;
    
    NSString *key;
    
    ok &= JS_ValueToObject(cx, argvp[0], &js_dict);
    ok &= jsval_to_NSString(cx, argvp[1], &key);
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    JSB_NSObject *dictProxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(js_dict);
    NSDictionary *dict = [dictProxy realObj];
    
    [real setObject:dict forKey:key];
	
	return JS_TRUE;
}

JSBool JSB_NSDictionary_setObjects_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 2, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    
    NSString *key;
    NSArray *arr;
    
    ok &= jsval_to_NSArray(cx, argvp[0], &arr);
    ok &= jsval_to_NSString(cx, argvp[1], &key);
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
    
    [real setObject:arr forKey:key];
	
	return JS_TRUE;
}

JSBool JSB_NSDictionary_getValue_forKey(JSContext *cx, uint32_t argc, jsval *vp) {
	
	JSObject* obj = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*)jsb_get_proxy_for_jsobject(obj);
	NSCAssert( proxy && [proxy realObj], @"Object already initialzied. error");
	
	JSB_PRECONDITION( argc == 1, "Invalid number of arguments" );
	
	NSMutableDictionary* real = (NSMutableDictionary*) [proxy realObj];
	
    jsval *argvp = JS_ARGV(cx,vp);
    JSBool ok = JS_TRUE;
    
    NSString *key;
    
    ok &= jsval_to_NSString(cx, argvp[0], &key);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    NSString *val = [real objectForKey:key];
	JS_SET_RVAL(cx, vp, unknown_to_jsval(cx, val));
    
	return JS_TRUE;
}


// Destructor
void JSB_NSDictionary_finalize(JSFreeOp *fop, JSObject *obj)
{
	CCLOGINFO(@"jsbindings: finalizing JS object %p (NSDictionary)", obj);
    
	jsb_del_proxy_for_jsobject( obj );
}

// Arguments: NSObject*, NSString*
// Ret value: NSMutableDictionar* (o)
JSBool JSB_NSDictionary_create(JSContext *cx, uint32_t argc, jsval *vp) {
	JSB_PRECONDITION3( argc == 0, cx, JS_FALSE, "Invalid number of arguments" );
	
	NSMutableDictionary* ret_val;
    
	ret_val = [NSMutableDictionary dictionary];
    
	JS_SET_RVAL(cx, vp, NSObject_to_jsval(cx, ret_val));
    
	return JS_TRUE;
}

JSBool JSB_NSDictionary_fromJSON(JSContext *cx, uint32_t argc, jsval *vp) {
	JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
    jsval *argvp = JS_ARGV(cx,vp);
    
    NSString *data_;
    JSBool ok = JS_TRUE;
    ok &= jsval_to_NSString(cx, argvp[0], &data_);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    data_ = [data_ stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    
    NSData *data = [data_ dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *ret_val = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingAllowFragments
                                                              error:&error];
    if (error){
        ok = JS_FALSE;
        NSLog(@"Error al leer json: %@", [error description]);
        JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    }
    
	JS_SET_RVAL(cx, vp, NSDictionary_to_jsval(cx, ret_val));
    
	return JS_TRUE;
}

void JSB_NSDictionary_createClass(JSContext* cx, JSObject* globalObj, const char *name )
{
	JSB_NSDictionary_class = (JSClass *)calloc(1, sizeof(JSClass));
	JSB_NSDictionary_class->name = name;
	JSB_NSDictionary_class->addProperty = JS_PropertyStub;
	JSB_NSDictionary_class->delProperty = JS_PropertyStub;
	JSB_NSDictionary_class->getProperty = JS_PropertyStub;
	JSB_NSDictionary_class->setProperty = JS_StrictPropertyStub;
	JSB_NSDictionary_class->enumerate = JS_EnumerateStub;
	JSB_NSDictionary_class->resolve = JS_ResolveStub;
	JSB_NSDictionary_class->convert = JS_ConvertStub;
	JSB_NSDictionary_class->finalize = JSB_NSDictionary_finalize;
	JSB_NSDictionary_class->flags = 0;
	
	static JSPropertySpec properties[] = {
		{0, 0, 0, 0, 0}
	};
	
	
	static JSFunctionSpec funcs[] = {
        JS_FN("setValueForKey", JSB_NSDictionary_setString_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
		JS_FN("setStringForKey", JSB_NSDictionary_setString_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("setArrayForKey", JSB_NSDictionary_setArray_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("setDictionaryForKey", JSB_NSDictionary_setDictionary_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("setIntegerForKey", JSB_NSDictionary_setInteger_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("setObjectsForKey", JSB_NSDictionary_setObjects_forKey, 2, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
		JS_FN("getValueForKey", JSB_NSDictionary_getValue_forKey, 1, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
		JS_FS_END
	};
	
	static JSFunctionSpec st_funcs[] = {
        JS_FN("create", JSB_NSDictionary_create, 0, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
        JS_FN("fromJSON", JSB_NSDictionary_fromJSON, 1, JSPROP_PERMANENT | JSPROP_SHARED | JSPROP_ENUMERATE),
		JS_FS_END
	};
	
	JSB_NSDictionary_object = JS_InitClass(cx, globalObj, JSB_NSObject_object, JSB_NSDictionary_class, JSB_NSDictionary_constructor,0,properties,funcs,NULL,st_funcs);
	JSBool found;
	JS_SetPropertyAttributes(cx, globalObj, name, JSPROP_ENUMERATE | JSPROP_READONLY, &found);
}

@implementation JSB_NSDictionary

+(JSObject*) createJSObjectWithRealObject:(id)realObj context:(JSContext*)cx
{
	JSObject *jsobj = JS_NewObject(cx, JSB_NSDictionary_class, JSB_NSDictionary_object, NULL);
    JSB_NSDictionary *proxy = [[JSB_NSDictionary alloc] initWithJSObject:jsobj class:[NSMutableDictionary class]];
	
	[proxy setRealObj:realObj];
	if( realObj ) {
		objc_setAssociatedObject(realObj, &JSB_association_proxy_key, proxy, OBJC_ASSOCIATION_RETAIN);
		[proxy release];
	}
	
	[self swizzleMethods];
	
	return jsobj;
}
@end

#pragma mark JSBCore - Free JS functions

JSBool JSBGamedoniaCore_initGamedonia(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
    JSBool b = JS_TRUE;
#ifdef kGamedoniaGameSecret
	
    jsval *argvp = JS_ARGV(cx,vp);
    int32_t key_type;
    
    JSBool ok = JS_ValueToInt32(cx, argvp[0], &key_type);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    GDOptions *options = [[[GDOptions alloc] init] autorelease];
    [options setPush:true];
    
    switch (key_type) {
        case kGamedoniaKeyTypeDevelopersNormal:
#ifdef kGamedoniaKeyDevelopersNormal
            [Gamedonia initializeWithOptions:kGamedoniaKeyDevelopersNormal secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion options:options];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Developers Normal Key specified but not defined. Use: #define kGamedoniaKeyDevelopersNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeDevelopersMaster:
#ifdef kGamedoniaKeyDevelopersMaster
            [Gamedonia initializeWithOptions:kGamedoniaKeyDevelopersMaster secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion options: options];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Developers Master Key specified but not defined. Use: #define kGamedoniaKeyDevelopersMaster @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionNormal:
#ifdef kGamedoniaKeyProductionNormal
            [Gamedonia initializeWithOptions:kGamedoniaKeyProductionNormal secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion options: options];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Production Normal Key specified but not defined. Use: #define kGamedoniaKeyProductionNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionMaster:
#ifdef kGamedoniaKeyProductionMaster
            [Gamedonia initializeWithOptions:kGamedoniaKeyProductionMaster secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion options: options];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Production Master Key specified but not defined. Use: #define kGamedoniaKeyProductionMaster @\"XXXXXX\"\n");
#endif
            break;
            
        default: {
            b = JS_FALSE;
            fprintf(stderr, "%s%d\n", "Unknown Key specified: \n",key_type);
            break;
        }
    }

#else
    fprintf(stderr, "%s\n", "No Game Secret Key specified. Use: #define kGamedoniaGameSecret @\"XXXXXX\"\n");
    b = JS_FALSE;
#endif
    
    JS_SET_RVAL(cx, vp, BOOLEAN_TO_JSVAL(b));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_initRequest(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
    JSBool b = JS_TRUE;
#ifdef kGamedoniaGameSecret
	
    jsval *argvp = JS_ARGV(cx,vp);
    int32_t key_type;
    
    JSBool ok = JS_ValueToInt32(cx, argvp[0], &key_type);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    switch (key_type) {
        case kGamedoniaKeyTypeDevelopersNormal:
#ifdef kGamedoniaKeyDevelopersNormal
            [GamedoniaRequest initialize:kGamedoniaKeyDevelopersNormal secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Developers Normal Key specified but not defined. Use: #define kGamedoniaKeyDevelopersNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeDevelopersMaster:
#ifdef kGamedoniaKeyDevelopersMaster
            [GamedoniaRequest initialize:kGamedoniaKeyDevelopersMaster secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Developers Master Key specified but not defined. Use: #define kGamedoniaKeyDevelopersMaster @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionNormal:
#ifdef kGamedoniaKeyProductionNormal
            [GamedoniaRequest initialize:kGamedoniaKeyProductionNormal secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Production Normal Key specified but not defined. Use: #define kGamedoniaKeyProductionNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionMaster:
#ifdef kGamedoniaKeyProductionMaster
            [GamedoniaRequest initialize:kGamedoniaKeyProductionMaster secret:kGamedoniaGameSecret apiServerUrl:kGamedoniaApiServerURL apiVersion:kGamedoniaApiVersion];
#else
            b = JS_FALSE;
            fprintf(stderr, "%s\n", "Production Master Key specified but not defined. Use: #define kGamedoniaKeyProductionMaster @\"XXXXXX\"\n");
#endif
            break;
            
        default: {
            b = JS_FALSE;
            fprintf(stderr, "%s%d\n", "Unknown Key specified: \n",key_type);
            break;
        }
    }
    
#else
    fprintf(stderr, "%s\n", "No Game Secret Key specified. Use: #define kGamedoniaGameSecret @\"XXXXXX\"\n");
    b = JS_FALSE;
#endif
    
    JS_SET_RVAL(cx, vp, BOOLEAN_TO_JSVAL(b));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_createUserWithEmailAndPassword(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 2, cx, JS_FALSE, "Invalid number of arguments" );
    jsval *argvp = JS_ARGV(cx,vp);
    
    NSString *email,*password;
    
    JSBool ok = JS_TRUE;
    ok &= jsval_to_NSString(cx, argvp[0], &email);
    ok &= jsval_to_NSString(cx, argvp[1], &password);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    GDUser* ret_val;
	ret_val = [[[GDUser alloc] init]autorelease];
    Credentials *c = [[[Credentials alloc] init] autorelease];
	[ret_val setCredentials:c];
    
    [c setEmail:email];
    [c setPassword:password];

	JSObject *jsobj = get_or_create_jsobject_from_realobj( cx, ret_val );
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_createUserWithOpenUDID(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
    jsval *argvp = JS_ARGV(cx,vp);
    
    NSString *p1_;
    
    JSBool ok = JS_TRUE;
    ok &= jsval_to_NSString(cx, argvp[0], &p1_);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    GDUser* ret_val;
	ret_val = [[[GDUser alloc] init]autorelease];
    Credentials *c = [[[Credentials alloc] init] autorelease];
	[ret_val setCredentials:c];
    
    [c setOpen_udid:p1_];
    
	JSObject *jsobj = get_or_create_jsobject_from_realobj( cx, ret_val );
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_createUserWithGameCenterId(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
    jsval *argvp = JS_ARGV(cx,vp);
    
    NSString *p1_;
    
    JSBool ok = JS_TRUE;
    ok &= jsval_to_NSString(cx, argvp[0], &p1_);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    GDUser* ret_val;
	ret_val = [[[GDUser alloc] init]autorelease];
    Credentials *c = [[[Credentials alloc] init] autorelease];
	[ret_val setCredentials:c];
    
    [c setGamecenter_id:p1_];
    
	JSObject *jsobj = get_or_create_jsobject_from_realobj( cx, ret_val );
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_createUserWithFacebookId(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 2, cx, JS_FALSE, "Invalid number of arguments" );
    jsval *argvp = JS_ARGV(cx,vp);
    
    NSString *p1_,*p2_;
    
    JSBool ok = JS_TRUE;
    ok &= jsval_to_NSString(cx, argvp[0], &p1_);
    ok &= jsval_to_NSString(cx, argvp[1], &p2_);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error processing arguments");
    
    GDUser* ret_val;
	ret_val = [[[GDUser alloc] init]autorelease];
    Credentials *c = [[[Credentials alloc] init] autorelease];
	[ret_val setCredentials:c];
    
    [c setFb_uid:p1_];
    [c setFb_access_token:p2_];
    
	JSObject *jsobj = get_or_create_jsobject_from_realobj( cx, ret_val );
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	return JS_TRUE;
};

JSBool JSBGamedoniaCore_createGDDeviceProfile(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSB_PRECONDITION3( argc == 0, cx, JS_FALSE, "Invalid number of arguments" );
    
    GDDeviceProfile* ret_val;
	ret_val = [[[GDDeviceProfile alloc] init]autorelease];

	JSObject *jsobj = get_or_create_jsobject_from_realobj( cx, ret_val );
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));
	return JS_TRUE;
};


JSBool jsval_to_gamedonia_result_block_1( JSContext *cx, jsval vp, JSObject *jsthis, js_gamedonia_result_block *ret)
{
    
    JSFunction *func = JS_ValueToFunction(cx, vp);
    JSB_PRECONDITION2( func, cx, JS_FALSE, "Error converting value to function");
    
    js_gamedonia_result_block block = ^(BOOL arg) {
        
        jsval rval;
        jsval res = BOOLEAN_TO_JSVAL((JSBool)arg);
        
        JSBool ok = JS_CallFunctionValue(cx, jsthis, vp, 1, &res, &rval);
        JSB_PRECONDITION2(ok, cx, , "Error calling gamedonia result callback (1)");
    };
    
    *ret = [[block copy] autorelease];
    return JS_TRUE;
}

JSBool jsval_to_gamedonia_result_block_2( JSContext *cx, jsval vp, JSObject *jsthis, js_gamedonia_result_with_data_block *ret)
{
    
    JSFunction *func = JS_ValueToFunction(cx, vp);
    JSB_PRECONDITION2( func, cx, JS_FALSE, "Error converting value to function");
    
    js_gamedonia_result_with_data_block block = ^(BOOL arg, NSObject* p0) {
        
        jsval rval;
        jsval args[2];
        args[0] = BOOLEAN_TO_JSVAL((JSBool)arg);
        args[1] = unknown_to_jsval(cx, p0);
        
        JSBool ok = JS_CallFunctionValue(cx, jsthis, vp, 2, args, &rval);
        JSB_PRECONDITION2(ok, cx, , "Error calling gamedonia result callback (2)");
    };
    
    *ret = [[block copy] autorelease];
    return JS_TRUE;
}
