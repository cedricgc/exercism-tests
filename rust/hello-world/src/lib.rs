
pub fn hello(name: Option<&str>) -> String {
    match name {
        Some(val) => format!("Hello, {}!", val).to_string(),
        None => "Hello, World!".to_string(),
    }
}
