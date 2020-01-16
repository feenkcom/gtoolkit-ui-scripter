use boxer::string::BoxerString;
use boxer::CBox;
use enigo::MouseButton;

#[derive(Debug, Copy, Clone)]
#[repr(u32)]
pub enum EnigoMouseButton {
    /// Left mouse button
    Left,
    /// Middle mouse button
    Middle,
    /// Right mouse button
    Right,

    /// Scroll up button
    ScrollUp,
    /// Left right button
    ScrollDown,
    /// Left right button
    ScrollLeft,
    /// Left right button
    ScrollRight,
}

impl From<EnigoMouseButton> for MouseButton {
    fn from(button: EnigoMouseButton) -> Self {
        match button {
            EnigoMouseButton::Left => MouseButton::Left,
            EnigoMouseButton::Middle => MouseButton::Middle,
            EnigoMouseButton::Right => MouseButton::Right,
            EnigoMouseButton::ScrollUp => MouseButton::ScrollUp,
            EnigoMouseButton::ScrollDown => MouseButton::ScrollDown,
            EnigoMouseButton::ScrollLeft => MouseButton::ScrollLeft,
            EnigoMouseButton::ScrollRight => MouseButton::ScrollRight,
        }
    }
}

#[no_mangle]
pub fn enigo_mouse_button_to_string(_enum: EnigoMouseButton, _string_ptr: *mut BoxerString) {
    CBox::with_optional_raw(_string_ptr, |option| match option {
        None => {}
        Some(string) => string.set_string(format!("{:?}", _enum)),
    })
}
