abstract class Scene {

  SceneCategory getSceneCategory();
}

enum SceneCategory {
  ghostLeg, // 사다리 타기
  rps, // 가위바위보
}

enum SceneState {

  /// 씬 생성중인 상태
  /// 서버 io 완료될때까지 기다림
  pending,

  /// 씬 준비 상태
  /// 플레이어 매칭
  ready,

  /// 씬 실행 상태
  /// 플레이어 조작
  playing,

  /// 씬 일시정지 상태
  // waiting,

  /// 씬 실행 종료중 상태
  /// 플레이어 결과 렌더링
  ending,

  /// 씬 폐기된 상태
  /// 서버 데이터 폐기
  terminated,
}