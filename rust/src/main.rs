use std::ffi::CString;
use libc::c_char;

extern "C" {
    fn ScanDockerImage(image: *const c_char, secure_api_token: *const c_char);
    fn ScanIACFile(file_path: *const c_char, secure_api_token: *const c_char);
}

fn main() {
    let image = CString::new("my-docker-image:latest").unwrap();
    let file_path = CString::new("/path/to/iac/file").unwrap();
    let secure_api_token = CString::new("some-token").unwrap();

    unsafe {
        ScanDockerImage(image.as_ptr(), secure_api_token.as_ptr());
        ScanIACFile(file_path.as_ptr(), secure_api_token.as_ptr());
    }
}

