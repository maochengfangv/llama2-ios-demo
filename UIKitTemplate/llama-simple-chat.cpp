/**
 * llama-simple-chat.cpp
 * 实现 llama_simple_load_model、llama_simple_new_context、llama_simple_predict
 * 用于简化 llama.cpp 推理流程，便于iOS集成
 */

#include "llama-simple-chat.h"
#include <string>

// 加载模型
void* llama_simple_load_model(const char* modelPath) {
    auto params = llama_model_default_params();
    return llama_load_model_from_file(modelPath, params);
}

// 创建推理上下文
void* llama_simple_new_context(void* model) {
    auto params = llama_context_default_params();
    return llama_new_context_with_model((llama_model*)model, params);
}

// 推理主流程：简单单轮对话
std::string llama_simple_predict(llama_context* ctx, const char* prompt, int maxTokens) {
    // TODO: 这里仅为模板，实际应基于 llama.cpp 的 example/simple.cpp 实现推理流程
    return "【模型调用成功，示例返回内容】";
}