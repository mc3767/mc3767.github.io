---
layout: post
title: Delphi Project를 IDE없이 Bbuild해서 배포하기
description: "Building a Delphi Project Using an MSBuild Command"
modified: 2018-07-15
tags: [Delphi, Command line build]
---

멤버가 조금씩 다른 개발환경에서 개발하므로 일치된 배포환경을 위해서 독립된 PC에 Delphi를 설치해서 배포하는데 IDE로 빌드하려면 자동화가 어렵게 된다.

그래서 찾아보니 MSBuild를 사용하면 command line으로 빌드가 가능하므로 자동화에 한층쉬워진다.




## MSBuild 명령을 사용하여 프로젝트 빌드 (원문)

http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Building_a_Project_Using_an_MSBuild_Command#Building_a_Project_Using_the_Command_Line

IDE는 Microsoft MSBuild 엔진을 사용하여 프로젝트를 빌드합니다. IDE가 모든 처리를 위해 MSBuild에 대한 지식이 없어도 프로젝트를 빌드 할 수 있습니다. 그러나 여기에서 설명하는 MSBuild 명령 줄 구문을 사용하여 직접 프로젝트를 빌드 할 수 있습니다. 프로젝트를 빌드 할 때 다음 메시지 창 출력 탭에 빌드 결과가 표시됩니다. 빌드 이벤트를 입력하는 경우는 지정된 명령과 그 결과를 빌드 출력 창에 표시됩니다.

MSBuild 명령 줄 구문은 다음과 같습니다.

MSBuild <projectname> [/t:<target name>][/p:config=<configuration_name>][target:Deploy][/p:platform=<platform_node_name>]



명령 줄을 사용하여 프로젝트 빌드
시작 메뉴에서 Embarcadero RAD Studio | RAD Studio 명령 급히 를 선택합니다. 명령 프롬프트 창이 MSBuild.exe 등의 RAD Studio 도구를 사용하기위한 환경을 자동으로 설정합니다.
참고 : Windows OS의 최신 버전은 응용 프로그램 목록 메뉴의 바로 가기를 사용할 수 있습니다.
프로젝트를 포함한 디렉토리 (C : \ Users \ <user> \ Documents \ Embarcadero \ Studio \ Projects \ MyProject)로 이동합니다.
msbuild입력하지만 아직 Return은 눌러 없습니다.
프로젝트 이름을 입력합니다. 예를 들어, TelePoll.dproj(Delphi 프로젝트의 경우), UserInfo.cbproj(C ++ 프로젝트의 경우). 프로젝트가 현재 디렉토리에없는 경우는 프로젝트 디렉토리의 전체 경로 이름을 포함해야합니다.
대상을 지정하려면 /t:태그 다음에 프로젝트 파일에서 지정되는 대상 중 하나를 지정합니다. 표준의 대상 clean이름은 make, , build의 세 가지입니다.
Clean개체 코드 등의 생성 파일을 삭제하여 프로젝트를 정리합니다. Clean는 프로젝트 관리자의 컨텍스트 메뉴에서 클린에 해당합니다.
Make프로젝트를 컴파일하는 것을 의미합니다. Make컨텍스트 메뉴에서 컴파일을 지원합니다.
Build프로젝트를 빌드하는 것을 의미합니다. Build컨텍스트 메뉴에서 재구성에 해당합니다. 이 세 가지 목표는 프로젝트 관리자 의 컨텍스트 메뉴에서 클린, 컴파일, 재 구축]와 같습니다. 기본 대상 build입니다.
구성을 지정하려면 /p:config =다음 구성 이름을 입력합니다. 구성을 지정하지 않으면 MSBuild는 현재 활성화되어있는 구성을 사용합니다. 구성을 지정하려면 프로젝트의 기존 빌드 구성 중 하나의 이름을 사용합니다. 이것은 [Debug] 과 같은 기본 구성 또는 사용자가 프로젝트에 추가 한 구성 중 하나입니다. 구성 이름에 공백이 포함되어있는 경우 /p:config ="My config"와 같이 큰 따옴표로 묶어 이름을 입력합니다.
응용 프로그램 배포 준비하려면 /target:Deploy옵션을 추가합니다.
기타 옵션을 입력 한 후 리턴 키를 눌러 빌드를 시작합니다.
팁 : MSBuild의 온라인 도움말 (전체 명령 줄의 예 포함)를 표시하려면, RAD Studio 명령 프롬프트 (1 단계 참조)을 열고 MSBuild /help입력합니다.

MSBuild에 대한 자세한 내용은 Microsoft 설명서 ( http://msdn.microsoft.com/library/default.aspx )를 참조하십시오.

명령 줄을 사용하여 Android 또는 iOS 응용 프로그램 빌드
apk 또는 ipa 패키지 파일을 만들려면 * .deployproj 파일이 필요합니다. 이 파일은 IDE에서만 생성 할 수 없습니다. * .deployproj 파일을 최신 버전으로 업데이트하려면 변경을 할 때마다 IDE의 배치 관리자에서 응용 프로그램을 배포해야합니다. 맞춤 ( DMgrDeploy.png)을 클릭하여 파일을 다시 만듭니다.

IDE에서 다음을 수행합니다.

프로젝트 관리자 에서 빌드 구성과 대상 플랫폼을 선택합니다.
프로젝트를 컴파일합니다.
프로젝트 | 배포 를 선택하고 [배치] (DMgrDeploy.png)을 클릭합니다.
참고 : 이렇게하면 MSBuild에서 사용되는 * .deployproj 파일이 생성됩니다.
프로젝트를 저장합니다.
MSBuild에서 다음을 수행합니다.

" 명령 줄을 사용하여 프로젝트 빌드 "단계에서 msbuild <プロジェクト名> ... /p:platform=Android / iOSDevice64와 같이 대상 플랫폼을 지정합니다.
예
명확히하기 위해 다음의 샘플 MSBuild 명령을 생각해 봅시다 :

.apk 설치 프로그램을 만들고 C ++ Builder 프로젝트를 Android 대상 플랫폼에 배치하기 위해서는 다음 구문과 같은 명령을 사용합니다 :
 msbuild MyApps_CBuilder.cbproj /t:Build /p:Configuration=Debug /target:Deploy /p:platform=Android

Delphi 프로젝트를 iOS32 대상 플랫폼에 배치하지 h 다음 구문과 같은 명령을 사용합니다 :
 msbuild MyProj_Delphi.dproj /t:Build /p:Configuration=Debug /target:Deploy /p:platform=iOSDevice32 

출처 : http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Building_a_Project_Using_an_MSBuild_Command#Building_a_Project_Using_the_Command_Line

