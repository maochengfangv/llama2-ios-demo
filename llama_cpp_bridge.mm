/**
 * llama_cpp_bridge.mm
 * 用于iOS端gguf模型本地推理，兼容 Llama2 和 小云雀Qwen，支持热切换
 * 必须配套：llama.cpp、llama-simple-chat.cpp
 */

#include "llama_cpp_bridge.h"
#include "llama-simple-chat.h"
#include <string>
#include <mutex>

// 静态全局模型 上下文
static void* model[2] = {nullptr, nullptr};
static void* ctx[2] = {nullptr, nullptr};
static std::mutex model_mutex;

/// Swift/OC 调用统一接口，自动初始化/切换模型
void llama_cpp_predict(int type, const char* prompt, char* out, int max_out_len) {
    std::lock_guard<std::mutex> lock(model_mutex);
    
    // 获取模型文件名（和 Swift/ModelType 保持一致）
    std::string fname = (type == 0) ? "llama-2-7b-chat.Q4_K_M.gguf" : "qwen2-0.5b-chat-fp16.gguf";
    int idx = (type == 0 ? 0 : 1);
    if (!model[idx]) {
        model[idx] = llama_simple_load_model(fname.c_str());
        ctx[idx] = llama_simple_new_context(model[idx]);
    }
    std::string reply = llama_simple_predict((llama_context*)ctx[idx], prompt, 128);
    strncpy(out, reply.c_str(), max_out_len - 1);
    out[max_out_len - 1] = 0;
}