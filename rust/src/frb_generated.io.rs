// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// Section: imports

use super::*;
use crate::api::aiscript::api::*;
use crate::api::aiscript::ui::*;
use crate::api::aiscript::*;
use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::{transform_result_dco, Lifetimeable, Lockable};
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate_io!();

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAiScript(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AiScript>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAiScript(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AiScript>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsApiLib(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner< AsApiLib>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsApiLib(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner< AsApiLib>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiButtonCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiButtonCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiButtonCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiButtonCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiLib(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner< AsUiLib>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiLib(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner< AsUiLib>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiMfmCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiMfmCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiMfmCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiMfmCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiNumberCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiNumberCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiNumberCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiNumberCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiSelectCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiSelectCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiSelectCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiSelectCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiSwitchCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiSwitchCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiSwitchCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiSwitchCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiTextInputCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiTextInputCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiTextInputCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiTextInputCallback>>::decrement_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiTextareaCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiTextareaCallback>>::increment_strong_count(ptr as _);
}

#[no_mangle]
pub extern "C" fn frbgen_aria_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAsUiTextareaCallback(
    ptr: *const std::ffi::c_void,
) {
    MoiArc::<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AsUiTextareaCallback>>::decrement_strong_count(ptr as _);
}
