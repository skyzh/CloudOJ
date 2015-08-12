# 给开发者们的话

-----------------------

## **Watcher API**

评测机使用约定好的 WatcherAPIKey 与服务器的 /oj/watcherapi 使用 HTTP 协议通信。

与 Watcher API 相关的函数都封装在 CloudOJWatcher 的 oj.py 内。当然 ojjudger.py 再一次封装了这些函数以便评测时方便调用。

通信的方式有纯文本和 JSON 两种。

PHP 服务器错误时，都会以 JSON 格式返回 `{status: "error", detail: "..."}`。

PHP 服务器成功处理请求，如果返回 JSON 格式，必有 `{status: "success"}`。

每一个请求都必须使用 POST 发出。除了 `Verify` 外，其他请求一律在 URL 中以 Query 形式附上 APIKey。

* oj.Verify

  检测 WatcherAPIKey 是否匹配。

* oj.GetTask

  向服务器请求接受任务，返回任务 id，题目 id，编译语言。

* oj.GetCode(`任务 id`)

  请求该任务所对应的代码。

* oj.GetData(`数据 id`, `类型`)

  请求数据。

* oj.GetDataList(`题目 id`)

  返回题目的数据列表。

* oj.PutRet(`任务 id`, `返回数据`):

  设置评测机的返回数据，显示在 Detail 中。

* oj.PutStatus(`任务 id`, `状态编号`, `占用内存`, `使用时间`)

  更新任务的摘要信息。如果出现运行时错误，编译不过，占用内存与时间均为零。


由于 CloudOJ 依然处于测试版本，各项功能仍然不够完善，评测机的 WatcherAPI 可能会不断变化。
