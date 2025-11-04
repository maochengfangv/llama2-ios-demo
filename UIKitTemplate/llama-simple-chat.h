/**
 * llama-simple-chat.h
 * llama.cpp 推理C++简化头文件
 * 用于本地推理，跨模型支持
 */

#pragma once
#include "llama.h"

#ifdef __cplusplus
extern "C" {
#endif

void* llama_simple_load_model(const char* modelPath);
void* llama_simple_new_context(void* model);
std::string llama_simple_predict(llama_context* ctx, const char* prompt, int maxTokens);

#ifdef __cplusplus
}
#endif
