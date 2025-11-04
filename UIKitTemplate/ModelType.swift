//
//  ModelType.swift
//  llama2-ios-demo
//
//  支持的模型类型（Llama2 & 小云雀Qwen）
//  可根据需要添加更多模型类型
//

import Foundation

enum ModelType: Int32 {
    case llama2 = 0    // Llama2
    case qwen = 1      // 小云雀Qwen
    
    /// 提供类型对应的C int类型
    var cIntType: Int32 { self.rawValue }
    
    /// 不同类型对应的模型文件名（需和实际资源一致）
    var modelFileName: String {
        switch self {
        case .llama2:
            return "llama-2-7b-chat.Q4_K_M.gguf"
        case .qwen:
            return "qwen2-0.5b-chat-fp16.gguf"
        }
    }
}