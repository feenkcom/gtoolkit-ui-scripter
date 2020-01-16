use crate::mouse_button::EnigoMouseButton;
use boxer::boxes::{ValueBox, ValueBoxPointer};
use enigo::{Enigo, MouseControllable};

#[no_mangle]
pub fn enigo_mouse_move_to(_ptr: *mut ValueBox<Enigo>, x: i32, y: i32) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_move_to(x, y);
    })
}

#[no_mangle]
pub fn enigo_mouse_move_relative(_ptr: *mut ValueBox<Enigo>, x: i32, y: i32) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_move_relative(x, y);
    })
}

#[no_mangle]
pub fn enigo_mouse_down(_ptr: *mut ValueBox<Enigo>, button: EnigoMouseButton) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_down(button.into());
    })
}

#[no_mangle]
pub fn enigo_mouse_up(_ptr: *mut ValueBox<Enigo>, button: EnigoMouseButton) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_up(button.into());
    })
}

#[no_mangle]
pub fn enigo_mouse_click(_ptr: *mut ValueBox<Enigo>, button: EnigoMouseButton) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_click(button.into());
    })
}

#[no_mangle]
pub fn enigo_mouse_mouse_scroll_x(_ptr: *mut ValueBox<Enigo>, length: i32) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_scroll_x(length);
    })
}

#[no_mangle]
pub fn enigo_mouse_mouse_scroll_y(_ptr: *mut ValueBox<Enigo>, length: i32) {
    _ptr.with_not_null(|enigo| {
        enigo.mouse_scroll_y(length);
    })
}