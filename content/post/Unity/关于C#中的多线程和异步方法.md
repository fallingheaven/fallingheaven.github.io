---
title: "C# ThreadPool、Task、UniTask 对比与分析"
date: 2025-04-20
tags: ["C#", "ThreadPool", "Task", "UniTask", "Unity", "异步"]
categories: ["Unity", "C#"]
---

# C# ThreadPool、Task、UniTask 对比与分析

## 1. ThreadPool

- **核心概念**：.NET Framework 提供的线程复用机制，避免频繁创建销毁线程。
- **适用场景**：短小的后台任务，通常不直接操作。
- **参考**：[.Net线程池原理简单解释](https://www.cnblogs.com/eventhorizon/p/15316955.html)

## 2. Task

- **核心概念**：异步操作的抽象，支持 async/await，通常调度到 ThreadPool。
- **优点**：简化异步编程，支持组合、异常处理、取消等。
- **参考**：[Task微软官方文档](https://learn.microsoft.com/zh-cn/dotnet/api/system.threading.tasks.task?view=net-8.0)

## 3. Unity 中的 Task

- **注意事项**：Unity 大部分 API 只能在主线程调用，直接用 Task 需注意线程同步和 GC 问题。
- **参考**：[Unity的Task和.Net的Task的不同](https://heerozh.com/post/unity-async-yi-bu-bian-cheng-ren-hua-zong-jie/)

## 4. UniTask

- **核心概念**：专为 Unity 优化的高性能 async/await 库，零 GC 分配，深度集成 Unity 生命周期。
- **优势**：支持 PlayerLoop、AsyncOperation、生命周期绑定、线程切换等。
- **参考**：[UniTask仓库ReadMe](https://github.com/Cysharp/UniTask/blob/master/README_CN.md)

## 5. 总结与对比

- ThreadPool 是底层，Task 是更高级抽象，UniTask 是针对 Unity 优化的 Task 替代品。
- Unity 项目推荐优先使用 UniTask 进行异步编程。

---

> 你可以根据自己的理解和实际项目经验，补充代码示例、性能对比、最佳实践等内容。