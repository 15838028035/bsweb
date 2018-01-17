#   贡献代码
### 1. fork代码
### 2. 创建分支
### 3. 修改代码，提交分支

Eclipse

    Download Eclipse from https://eclipse.org/downloads/ Choose Eclipse IDE for Java Developers or Eclipse IDE for Java EE Developers
    Import the project File - Import - Existing Maven projects - point to the project root folder
    Configure Checkstyle plugin Window - Preferences - Checkstyle - New - External Configuration File -> Name it and point to checkstyle.xml -> Set as default
    Right click java-design-patterns project in Project Explorer and choose Checkstyle - Create formatter profile
    Activate formatter profile Window - Preferences - Java - Code style - Formatter - Active profile -> choose the one you just created -> Apply
    You can run Checkstyle in Eclipse IDE by selecting the project(s) in package/project explorer, right-clicking the project and choosing Checkstyle - Check Code with Checkstyle


### 4. 发送pull request

Reviewing pull requests


Reviewing incoming pull requests is an open process where anyone can participate and give improvement suggestions. That being said, accepting a pull request can be done by a core team member. The general guidelines for code review are given below.

As a reviewer, you need to ensure

    Add yourself as a reviewer
    Put under review badge to the pull request
    Check that the code compiles and the existing tests succeed (Travis build does this)
     Does the example code have proper tests and enough test coverage?
    Is the example code commented well enough?
    Are the project coding conventions being followed (Checkstyle handles this and fails the build in case of deviations)?
    

