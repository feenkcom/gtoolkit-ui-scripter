extern crate boxer;
extern crate enigo;
extern crate libc;

pub mod mouse;
pub mod mouse_button;

use boxer::boxes::{ValueBox, ValueBoxPointer};
use enigo::Enigo;

#[no_mangle]
pub fn enigo_test() -> bool {
    return true;
}

#[no_mangle]
pub fn enigo_new() -> *mut ValueBox<Enigo> {
    ValueBox::new(Enigo::new()).into_raw()
}

#[no_mangle]
pub fn enigo_drop(_ptr: *mut ValueBox<Enigo>) {
    _ptr.drop();
}
