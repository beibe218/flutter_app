String weekDD2China(String week){
  String weekChina = '';
  switch(week){
    case 'Monday':
      weekChina = '星期一';
      break;
    case 'Tuesday':
      weekChina = '星期二';
      break;
    case 'Wednesday':
      weekChina = '星期三';
      break;
    case 'Thursday':
      weekChina = '星期四';
      break;
    case 'Friday':
      weekChina = '星期五';
      break;
    case 'Saturday':
      weekChina = '星期六';
      break;
    case 'Sunday':
      weekChina = '星期日';
      break;
  }
  return weekChina;
}

