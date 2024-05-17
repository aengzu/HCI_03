class Notice {
  final String title;
  final String description;

  Notice({required this.title, required this.description});
}

List<Notice> dummyNotices = [
  Notice(
    title: '상대방 등록하기',
    description: '경쟁하고 싶은 상대방에게 도전장을 보내세요!',
  ),
  Notice(
    title: '목표 정하기',
    description: '친구와 함께 이루어나갈 공통의 목표를 정해봐요!',
  ),
  Notice(
    title: '목표 정하기',
    description: '나의 기상미션 시간을 정해봐요!',
  ),
  Notice(
    title: '기상 미션 설정하기',
    description: '경쟁하고 싶은 상대방의 기상 미션을 설정해주세요!',
  ),
  Notice(
    title: '대결 신청 완료!',
    description: '이제 상대방이 대결 신청을 수락하면 대결이 시작돼요 ☺️',
  ),
  Notice(
    title: '이번달 공약',
    description: '지는 사람이 베스타 사기☺️',
  ),
];
