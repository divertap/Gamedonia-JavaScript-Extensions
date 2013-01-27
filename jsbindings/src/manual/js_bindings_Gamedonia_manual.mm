//  ____ ____ ____ ____ ____ ____ ____ ____
// ||D |||i |||v |||e |||r |||t |||a |||p ||
// ||__|||__|||__|||__|||__|||__|||__|||__||
// |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
//
//  Copyright Divertap 2013. All rights reserved.

#import "js_bindings_config.h"

#ifdef JSB_INCLUDE_GAMEDONIA

#import "jsapi.h"
#import "jsfriendapi.h"

#import "js_bindings_core.h"
#import "js_bindings_Gamedonia_core.h"
#import "js_bindings_Gamedonia_classes.h"
#import "js_bindings_basic_conversions.h"


// Manually generated methods
JSBool JSB_GamedoniaUsers_createUser_callback_(JSContext *cx, uint32_t argc, jsval *vp){    
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	JSObject *js_user = NULL;           //argvp[0] user to be created
	js_gamedonia_result_block js_func;  //argvp[1] get "callback fn"
    JSObject *js_this = NULL;           //argvp[2] get "this"
    
	JSBool ok = JS_TRUE;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[2] );
	}
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[1] );
    
    ok &= JS_ValueToObject(cx, argvp[0], &js_user);
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    JSB_NSObject *userProxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(js_user);
    GDUser *u = [userProxy realObj];
    [u set_id:nil];
    
    CCLOG(@"Creating new user for %@ and _id: (%@)",[u.profile objectForKey:@"name"],u._id);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users createUser: u callback: js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}

JSBool JSB_GamedoniaUsers_loginUserWithGameCenterId_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *id_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[2] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &id_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[1] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login GC %@",id_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithGameCenterId:id_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_loginUserWithOpenUDID_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==1 || argc ==2, "Invalid number of arguments. Expecting 1 or 2 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;

    if(argc==2) {
		ok &= JS_ValueToObject(cx, argvp[1], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[1] );
	}
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[0], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[0] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login OpenUDID");
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithOpenUDID:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_loginUserWithEmail_password_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *e_,*p_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}

	ok &= jsval_to_NSString( cx, argvp[0], &e_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login Email %@ Password %@",e_,p_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithEmail:e_ password:p_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_loginUserWithFacebook_fbAccessToken_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *e_,*p_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &e_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login FB %@ %@",e_,p_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithFacebook:e_ fbAccessToken:p_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_loginUserWithTwitter_twTokenSecret_twToken_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==4 || argc ==5, "Invalid number of arguments. Expecting 4 or 5 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_,*p3_;
    
    if(argc==5) {
		ok &= JS_ValueToObject(cx, argvp[4], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[4] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[3], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[3] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login TW %@ %@ %@",p1_,p2_,p3_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithTwitter:p1_ twTokenSecret:p2_ twToken:p3_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}

JSBool JSB_GamedoniaUsers_loginUserWithSessionToken_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *id_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[2] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &id_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[1] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Login ST %@",id_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users loginUserWithSessionToken:id_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_logoutUser_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==1 || argc ==2, "Invalid number of arguments. Expecting 1 or 2 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    
    if(argc==2) {
		ok &= JS_ValueToObject(cx, argvp[1], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[1] );
	}
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[0], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[0] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Logout");
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users logoutUser:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_getUser_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *id_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[2] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &id_ );
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[1] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"GetUser %@",id_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users getUser:id_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_getMe_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==1 || argc ==2, "Invalid number of arguments. Expecting 1 or 2 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    
    if(argc==2) {
		ok &= JS_ValueToObject(cx, argvp[1], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[1] );
	}
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[0], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[0] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"GetMe");
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users getMe:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_updateUser_overwrite_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	JSObject *js_user = NULL;           //argvp[0] profile data
    JSBool override = JS_FALSE;         //argvp[1] override
	js_gamedonia_result_block js_func;  //argvp[2] get "callback fn"
    JSObject *js_this = NULL;           //argvp[3] get "this"
    
	JSBool ok = JS_TRUE;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
    ok &= JS_ValueToBoolean(cx, argvp[1], &override);
    ok &= JS_ValueToObject(cx, argvp[0], &js_user);
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    JSB_NSObject *userProxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(js_user);
    NSDictionary *u = [userProxy realObj];
    
    CCLOG(@"Update user with %@",u);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users updateUser: u overwrite: (BOOL)override callback: js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_changePassword_currentPassword_newPassword_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==4 || argc ==5, "Invalid number of arguments. Expecting 4 or 5 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_,*p3_;
    
    if(argc==5) {
		ok &= JS_ValueToObject(cx, argvp[4], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[4] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[3], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[3] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Change pass %@ %@ %@",p1_,p2_,p3_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users changePassword:p1_ currentPassword:p2_ newPassword:p3_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_resetPassword_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[2] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[1] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Reset pass for %@",p1_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users resetPassword:p1_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_restorePassword_newPassword_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Restore %@ %@",p1_,p2_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users restorePassword:p1_ newPassword:p2_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaUsers_search_limit_sort_skip_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==5 || argc ==6, "Invalid number of arguments. Expecting 5 or 6 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p3_;
    int p2_,p4_;
    
    
    if(argc==6) {
		ok &= JS_ValueToObject(cx, argvp[5], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[5] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_int( cx, argvp[1], &p2_ );
    ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
    ok &= jsval_to_int( cx, argvp[3], &p4_ );
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[4], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[4] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Query %@ %d %@ %d",p1_,p2_,p3_,p4_);
    
	GamedoniaUsers *users = (GamedoniaUsers*) [proxy realObj];
    [users search:p1_ limit:p2_ sort:p3_ skip:p4_ callback: js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}


// Manually generated methods
JSBool JSB_GamedoniaRequest_post_content_auth_sessionToken_gameid_success_failure__static(JSContext *cx, uint32_t argc, jsval *vp){
	JSB_PRECONDITION( argc==3 || argc ==4 || argc==6 || argc ==7, "Invalid number of arguments. Expecting 3,4,6 or 7 arguments" );
    
    GamedoniaRequest *fakeObj = [[[GamedoniaRequest alloc] init] autorelease];
    JSObject *fakeJsthis = get_or_create_jsobject_from_realobj( cx, fakeObj );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_,*p3_,*p4_,*p5_;
    
    if(argc > 4) {
        if(argc == 7) {
            ok &= JS_ValueToObject(cx, argvp[6], &js_this);
            ok &= jsb_set_reserved_slot(fakeJsthis, 1, argvp[6] );
        }
        ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
        ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
        ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
        ok &= jsval_to_NSString( cx, argvp[3], &p4_ );
        ok &= jsval_to_NSString( cx, argvp[4], &p5_ );
        
        ok &= jsval_to_gamedonia_result_block_2( cx, argvp[5], js_this, &js_func );
        ok &= jsb_set_reserved_slot(fakeJsthis, 0, argvp[5] );
        
        JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
        
        CCLOG(@"Post5 %@ %@ %@ %@ %@",p1_,p2_,p3_,p4_,p5_);
        
        [GamedoniaRequest post:p1_ content:p2_ auth:p3_ sessionToken:p4_ gameid:p5_
                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                           js_func(TRUE,JSON);
                       }
                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                           
                           js_func(FALSE,error);
                       }
         ];
    }
    else {
        if(argc==4) {
            ok &= JS_ValueToObject(cx, argvp[3], &js_this);
            ok &= jsb_set_reserved_slot(fakeJsthis, 1, argvp[3] );
        }
        
        ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
        ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
        
        ok &= jsval_to_gamedonia_result_block_2( cx, argvp[2], js_this, &js_func );
        ok &= jsb_set_reserved_slot(fakeJsthis, 0, argvp[2] );
        
        JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
        
        CCLOG(@"Post2 %@ %@",p1_,p2_);
        
        [GamedoniaRequest post:p1_ content:p2_
                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                           js_func(TRUE,JSON);
                       }
                       failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                           
                           js_func(FALSE,error);
                       }
         ];
    }
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaRequest_sign_secret_data_contentType_date_requestMethod_path__static(JSContext *cx, uint32_t argc, jsval *vp){
	JSB_PRECONDITION( argc==4 || argc ==6, "Invalid number of arguments. Expecting 4 or 6 arguments" );
    NSString *ret_;
#ifdef kGamedoniaGameSecret
	jsval *argvp = JS_ARGV(cx,vp);
    
	JSBool ok = JS_TRUE;
    int p1_;
    NSString *p2_,*p3_,*p4_,*p5_,*p6_;
    NSString *key_;
    
    ok &= jsval_to_int( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
    ok &= jsval_to_NSString( cx, argvp[3], &p4_ );
    
    
    switch (p1_) {
        case kGamedoniaKeyTypeDevelopersNormal:
#ifdef kGamedoniaKeyDevelopersNormal
            key_ = kGamedoniaKeyDevelopersNormal;
#else
            fprintf(stderr, "%s\n", "Developers Normal Key specified but not defined. Use: #define kGamedoniaKeyDevelopersNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeDevelopersMaster:
#ifdef kGamedoniaKeyDevelopersMaster
            key_ = kGamedoniaKeyDevelopersMaster;
#else
            fprintf(stderr, "%s\n", "Developers Master Key specified but not defined. Use: #define kGamedoniaKeyDevelopersMaster @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionNormal:
#ifdef kGamedoniaKeyProductionNormal
            key_ = kGamedoniaKeyProductionNormal;
#else
            fprintf(stderr, "%s\n", "Production Normal Key specified but not defined. Use: #define kGamedoniaKeyProductionNormal @\"XXXXXX\"\n");
#endif
            break;
        case kGamedoniaKeyTypeProductionMaster:
#ifdef kGamedoniaKeyProductionMaster
            key_ = kGamedoniaKeyProductionMaster;
#else
            fprintf(stderr, "%s\n", "Production Master Key specified but not defined. Use: #define kGamedoniaKeyProductionMaster @\"XXXXXX\"\n");
#endif
            break;
        default: {
            fprintf(stderr, "%s%d\n", "Unknown Key specified: \n",p1_);
            break;
        }
    }
    
    if( key_!=nil ) {
        if(argc == 6) {
            ok &= jsval_to_NSString( cx, argvp[4], &p5_ );
            ok &= jsval_to_NSString( cx, argvp[5], &p6_ );
            
            JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
            
            CCLOG(@"Sign6 %d %@ %@ %@ %@ %@",p1_,p2_,p3_,p4_,p5_,p6_);
            
            ret_ = [GamedoniaRequest sign:key_ secret:kGamedoniaGameSecret data:p2_ contentType:p3_ date:p4_ requestMethod:p5_ path:p6_];
        }
        else {
            JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
            
            CCLOG(@"Sign4 %d %@ %@ %@",p1_,p2_,p3_,p4_);
            
            ret_ = [GamedoniaRequest sign:key_ secret:kGamedoniaGameSecret date:p2_ requestMethod:p3_ path:p4_
                    ];
        }
    }
    
#else
    fprintf(stderr, "%s\n", "No Game Secret Key specified. Use: #define kGamedoniaGameSecret @\"XXXXXX\"\n");
#endif
    JS_SET_RVAL(cx, vp, NSString_to_jsval(cx, ret_));
    return JS_TRUE;
}
JSBool JSB_GamedoniaRequest_get_sessionToken_success_failure__static(JSContext *cx, uint32_t argc, jsval *vp){
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
    GamedoniaRequest *fakeObj = [[[GamedoniaRequest alloc] init] autorelease];
    JSObject *fakeJsthis = get_or_create_jsobject_from_realobj( cx, fakeObj );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(fakeJsthis, 1, argvp[3] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(fakeJsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Get %@ %@",p1_,p2_);
    
    [GamedoniaRequest get:p1_ sessionToken:p2_ 
                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                      js_func(TRUE,JSON);
                  }
                  failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                      
                      js_func(FALSE,error);
                  }
     ];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaRequest_put_content_auth_sessionToken_gameid_success_failure__static(JSContext *cx, uint32_t argc, jsval *vp){
	JSB_PRECONDITION( argc==6 || argc ==7, "Invalid number of arguments. Expecting 6 or 7 arguments" );
    
    GamedoniaRequest *fakeObj = [[[GamedoniaRequest alloc] init] autorelease];
    JSObject *fakeJsthis = get_or_create_jsobject_from_realobj( cx, fakeObj );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_,*p3_,*p4_,*p5_;
    
    if(argc==7) {
		ok &= JS_ValueToObject(cx, argvp[6], &js_this);
        ok &= jsb_set_reserved_slot(fakeJsthis, 1, argvp[6] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );
    ok &= jsval_to_NSString( cx, argvp[2], &p3_ );
    ok &= jsval_to_NSString( cx, argvp[3], &p4_ );
    ok &= jsval_to_NSString( cx, argvp[4], &p5_ );
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[5], js_this, &js_func );
    ok &= jsb_set_reserved_slot(fakeJsthis, 0, argvp[5] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Put %@ %@ %@ %@ %@",p1_,p2_,p3_,p4_,p5_);
    
    [GamedoniaRequest put:p1_ content:p2_ auth:p3_ sessionToken:p4_ gameid:p5_
                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                      js_func(TRUE,JSON);
                  }
                  failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                      
                      js_func(FALSE,error);
                  }
     ];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaRequest_del_success_failure__static(JSContext *cx, uint32_t argc, jsval *vp){
	JSB_PRECONDITION( argc==2 || argc ==3, "Invalid number of arguments. Expecting 2 or 3 arguments" );
    
    GamedoniaRequest *fakeObj = [[[GamedoniaRequest alloc] init] autorelease];
    JSObject *fakeJsthis = get_or_create_jsobject_from_realobj( cx, fakeObj );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_;
    
    if(argc==3) {
		ok &= JS_ValueToObject(cx, argvp[2], &js_this);
        ok &= jsb_set_reserved_slot(fakeJsthis, 1, argvp[2] );
	}
    
	ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[1], js_this, &js_func );
    ok &= jsb_set_reserved_slot(fakeJsthis, 0, argvp[1] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Del %@",p1_);
    
    [GamedoniaRequest del:p1_
                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                      js_func(TRUE,JSON);
                  }
                  failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {

                      js_func(FALSE,error);
                  }
     ];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}

// Manually generated methods
JSBool JSB_GamedoniaData_create_entity_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_data = NULL;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *c_;
    NSDictionary *data_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &c_ );
    ok &= JS_ValueToObject(cx, argvp[1], &js_data);
    
    JSB_NSObject *userProxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(js_data);
    data_ = [userProxy realObj];
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Create entity %@ %@",c_,data_);
    
	GamedoniaData *d = (GamedoniaData*) [proxy realObj];
    [d create:c_ entity:data_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaData_remove_entityId_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *c_;
    NSString *id_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &c_ );
    ok &= jsval_to_NSString(cx, argvp[1], &id_);
    
	ok &= jsval_to_gamedonia_result_block_1( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Remove entity %@ %@",c_,id_);
    
	GamedoniaData *d = (GamedoniaData*) [proxy realObj];
    [d remove:c_ entityId:id_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaData_update_entity_overwrite_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==4 || argc ==5, "Invalid number of arguments. Expecting 4 or 5 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_data = NULL;
    JSBool override = JS_FALSE;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *c_;
    NSDictionary *data_;
    
    if(argc==5) {
		ok &= JS_ValueToObject(cx, argvp[4], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[4] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &c_ );
    ok &= JS_ValueToObject(cx, argvp[1], &js_data);
    ok &= JS_ValueToBoolean(cx, argvp[2], &override);
    
    JSB_NSObject *userProxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(js_data);
    data_ = [userProxy realObj];
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[3], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[3] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Update entity %@ %@ %d",c_,data_,override);
    
	GamedoniaData *d = (GamedoniaData*) [proxy realObj];
    [d update:c_ entity:data_ overwrite: (BOOL)override callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaData_get_entityId_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc ==4, "Invalid number of arguments. Expecting 3 or 4 arguments" );
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *c_;
    NSString *id_;
    
    if(argc==4) {
		ok &= JS_ValueToObject(cx, argvp[3], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[3] );
	}
    
    ok &= jsval_to_NSString( cx, argvp[0], &c_ );
    ok &= jsval_to_NSString(cx, argvp[1], &id_);
    
	ok &= jsval_to_gamedonia_result_block_2( cx, argvp[2], js_this, &js_func );
    ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Get entity %@ %@",c_,id_);
    
	GamedoniaData *d = (GamedoniaData*) [proxy realObj];
    [d get:c_ entityId:id_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}
JSBool JSB_GamedoniaData_search_query_limit_sort_skip_callback_(JSContext *cx, uint32_t argc, jsval *vp){
    JSObject* jsthis = (JSObject *)JS_THIS_OBJECT(cx, vp);
	JSB_NSObject *proxy = (JSB_NSObject*) jsb_get_proxy_for_jsobject(jsthis);
	
	JSB_PRECONDITION( proxy && [proxy realObj], "Invalid Proxy object");
	JSB_PRECONDITION( argc==3 || argc==4 || argc==5 || argc==6 || argc ==7, "Invalid number of arguments. Expecting 3,4,5,6 or 7 arguments" );
    
    CCLOG(@"Search args: %d",argc);
    
	jsval *argvp = JS_ARGV(cx,vp);
	js_gamedonia_result_with_data_block js_func;
    JSObject *js_this = NULL;
    
	JSBool ok = JS_TRUE;
    NSString *p1_,*p2_,*p4_;
    int p3_,p5_;
    
    if(argc==7) {
        ok &= JS_ValueToObject(cx, argvp[6], &js_this);
        ok &= jsb_set_reserved_slot(jsthis, 1, argvp[6] );
    }
    
    ok &= jsval_to_NSString( cx, argvp[0], &p1_ );
    ok &= jsval_to_NSString( cx, argvp[1], &p2_ );

    if( argc>3) {
        ok &= jsval_to_int( cx, argvp[2], &p3_ );
        if( argc>4 ) {
            ok &= jsval_to_NSString( cx, argvp[3], &p4_ );
            if( argc>5) {
                ok &= jsval_to_int( cx, argvp[4], &p5_ );
        
                ok &= jsval_to_gamedonia_result_block_2( cx, argvp[5], js_this, &js_func );
                ok &= jsb_set_reserved_slot(jsthis, 0, argvp[5] );
            }
            else {
                ok &= jsval_to_gamedonia_result_block_2( cx, argvp[4], js_this, &js_func );
                ok &= jsb_set_reserved_slot(jsthis, 0, argvp[4] );
            }
        }
        else {
            ok &= jsval_to_gamedonia_result_block_2( cx, argvp[3], js_this, &js_func );
            ok &= jsb_set_reserved_slot(jsthis, 0, argvp[3] );
        }
    }
    else {
        ok &= jsval_to_gamedonia_result_block_2( cx, argvp[2], js_this, &js_func );
        ok &= jsb_set_reserved_slot(jsthis, 0, argvp[2] );
	}
    
	JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
	
    CCLOG(@"Query %@ %@ %d %@ %d",p1_,p2_,p3_,p4_,p5_);
    
	GamedoniaData *d = (GamedoniaData*) [proxy realObj];
    [d search:p1_ query:p2_ limit:p3_ sort:p4_ skip:p5_ callback:js_func];
    
	JS_SET_RVAL(cx, vp, JSVAL_VOID);
    
    return JS_TRUE;
}

// Manually generated methods
JSBool JSB_GamedoniaRequest_hmacsha1_secret__static(JSContext *cx, uint32_t argc, jsval *vp){
    JSB_PRECONDITION3( argc == 1, cx, JS_FALSE, "Invalid number of arguments" );
#ifdef kGamedoniaGameSecret
	
    jsval *argvp = JS_ARGV(cx,vp);
    jsval ret;
    NSString *p1_;
    
    JSBool ok = jsval_to_NSString(cx, argvp[0], &p1_);
    JSB_PRECONDITION3(ok, cx, JS_FALSE, "Error parsing arguments");
    
    NSString *hmacsha1 = [GamedoniaRequest hmacsha1:p1_ secret:kGamedoniaGameSecret];
    ret = NSString_to_jsval(cx,hmacsha1);
    
#else
    fprintf(stderr, "%s\n", "No Game Secret Key specified. Use: #define kGamedoniaGameSecret @\"XXXXXX\"\n");
#endif
    
    JS_SET_RVAL(cx, vp, ret);
	return JS_TRUE;
}

#endif // JSB_INCLUDE_GAMEDONIA

