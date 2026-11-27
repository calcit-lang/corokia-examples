# Corokia Examples

这个仓库提供 Corokia 示例索引。原运行时解释器已退役，页面保留示例源码入口。

## 开发

使用正式 Calcit / `@calcit/procs` 0.46.0、Node 24 和 Yarn 4.18.0。更新依赖后重新安装模块并构建；Respo 补丁更新可能影响样式。

```sh
caps --strict --ci
yarn install --immutable
caps verify --toolchain
calcit --check-only --all-defs
calcit fix --workflow strict --verify
yarn build
```

源码维护 `calcit.cirru` 和 `deps.cirru`，不提交生成的 `js-out` 或 `dist`。

PR 前端资源使用独立 COS 前缀和 action 内置校验；main / master 的 rsync 目标保持原仓库目录。
