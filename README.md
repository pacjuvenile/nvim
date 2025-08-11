# Git使用方法

## 设置本地Git全局配置

编辑`~/.gitconfig`文件

```toml
[user]
  name = user_name
  email = user_email
```



## 管理本地Git仓库

1. 创建并进入项目工程所在目录

2. 从Git代码托管平台获取代码

    ```sh
    git clone <repo_url> # 克隆代码至当前目录
    git clone <repo_url> <directory> # 克隆代码至指定目录
    ```

3. Git初始化

    ```sh
    git init	# git初始化
    ```

    完成初始化后，本地Git仓库就产生了，此时有三个分区概念：

    - 工作区：由当前目录中不被记录到`.gitignore`的文件/目录组成
    - 暂存区：本地Git提交的缓冲区
    - 本地版本库：本地Git提交的仓库

4. 查看当前Git仓库的文件状态

    ```sh
    git status	# 查看文件状态
    ```

5. 将工作区中的更改提交到暂存区

    ```sh
    git add .		  # 将所有文件存入本地暂存区
    git add -- <file> # 将特定文件存入本地暂存区
    ```

6. 将暂存区中的更改提交到本地版本库

    ```sh
    git commit -m '<message>'  # 完成一次本地版本提交
    ```

7. 查看提交到本地版本库的记录

    ```sh
    git log    # 查看提交到本地版本库的当前版本以前的记录
    git reflog # 查看提交到本地版本库的所有记录
    ```

8. 状态回滚

    1. 回滚工作区改动后的文件状态

        ```shell
        git checkout . # 将工作区改动后所有文件恢复至原状态
        git checkout -- <file> # 将工作区改动后的特定文件恢复至原状态
        ```

    2. 回滚暂存区的文件状态至工作区

        ```shell
        git reset . # 将暂存区的所有文件恢复至工作区
        git reset -- <file> # 将暂存区的特定文件恢复至工作区
        ```

    3. 回滚本地版本库的版本

        ```shell
        git reset --hard 版本号 # 将当前版本回滚至以前的版本
        ```

9. 本地分支管理

    1. 新建分支

        ```sh
        git branch <branch> # 创建新的分支
        ```

    2. 切换分支

        ```shell
        git checkout <branch> # 切换至特定分支
        ```

    3. 分支合并

        ```shell
        git checkout <branch>  	# 切换至合并其他分支的分支
        git merge <branch> 		# 在该分支上合并其他分支
        ```

    4. 删除分支

        ```shell
        git branch -d <branch>	# 删除特定分支
        ```

10. 使用`.gitignore`忽略文件
    - 使用`git ls-files`查看被Git管理起来的文件

## 使用远程Git仓库

1. 生成SSH密钥

    - 使用`ssh-keygen`生成ssh的一对公钥和私钥
        - `-t`：指定密钥算法，常用`ed225519`/`rsa`，`ecdsa`/`dsa`逐渐被弃用
        - `-b`：指定密钥位数，仅对`rsa`/`ecdsa`有效
        - `-C`：添加注释
        - `-f`：指定密钥保存路径和文件名，默认公钥为`~/.ssh/id_<type>.pub`，私钥为`~/.ssh/id_<type>`
        - `-N`：为私钥设置密码，默认为`""`
    - 复制公钥的内容，粘贴至Git代码托管平台的账户密钥中
    - 测试本地私钥是否已正确绑定到Git代码托管平台的账户

    ```shell
    ssh-keygen -t ed225519 -C "<user_email>" # 生成ED225519密钥
    # ssh-keygen -t rsa -b 4096 -C "<user_email>" # 生成4096位的RSA密钥
    ssh -T git@<host_name> # 测试私钥是否正确绑定到Git代码托管平台的账户
    ```

2. 创建远程Git仓库

3. 设置远程Git仓库

    ```shell
    git remote add <repo_name> git@<host_name>:<user_name>/<project_name>
    ```

4. 查看远程Git仓库设置

    ```shell
    git remote -v
    ```

    - 切换连接到远程仓库的协议为HTTPS

        ```shell
        git remote set-url <repo_name> https://<host_name>/<user_name>/<project_name>
        ```

    - 切换连接到远程仓库的协议为SSH

        ```sh
        git remote set-url <repo_name> git@<host_name>:<user_name>/<project_name>
        ```

5. 本地仓库与远程仓库的交互

    1. 推送代码至远程仓库对应分支

        ```shell
        git push <repo_name> <branch_name>
        ```

    2. 删除远程仓库对应分支

        ```shell
        git push <repo_name> :<branch_name>
        ```

    3. 从远程仓库中抓取分支至本地仓库

        ```shell
        git pull <repo_name> <branch_name>
        ```

