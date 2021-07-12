//
//  AppComponent.swift
//  swift-ribs
//
//  Created by OSeung Nam on 2021/07/12.
//

import RIBs
/*
 Component는 RIB종속성을 관리하는데 사용함
 RIB을 구성하는 다른 Unit을 인스턴스화하여 Builder를 지원함.
 - RIB을 구축하는데 필요한 외부 종속성에 대한 엑세스 제공
 - RIB자체에서 생성된 종속성을 소유
 - 다른 RIB에서 위 엑세스를 제어
 - 부모 RIB의 Component는 일반적으로 자식 RIB의 Builder에 주입되어 자식에서 부모 RIB의 종속성에 대한 액세스 권한을 부여함
 */
class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
