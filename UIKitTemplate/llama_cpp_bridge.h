/**
 * llama_cpp_bridge.h - Swift/Objective-C 用于 iOS 跨语言调用
 * 提供多模型类型选择（llama2/qwen）支持
 */

#ifdef __cplusplus
extern "C" {
#endif

/// type: 0 = llama2, 1 = qwen
void llama_cpp_predict(int type, const char* prompt, char* out, int max_out_len);

#ifdef __cplusplus
}
#endif
