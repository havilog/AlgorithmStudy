const hourToNumber = (time) => {
  return Number(time[0]) * 60 + Number(time[1]);
};

const timeDiffFunc = (before, after) => {
  //시간 차이를 구하는 함수
  return hourToNumber(after.split(":")) - hourToNumber(before.split(":"));
};

const makeString = (time, str) => {
  //time의 길이만큼 문자열을 생성하는 함수
  let result = "";
  let len = str.length;
  for (let i = 0; i < time; i++) result += str.charAt(i % len);
  return result;
};

const changeString = (str) => {
  //C#, D#, F#, G#, A#을 H, I, J, K, L로 바꿔줌
  let result = "";
  for (let i = 0; i < str.length; i += 2) {
    if (str[i] === "C" && str[i + 1] === "#") result += "H";
    else if (str[i] === "D" && str[i + 1] === "#") result += "I";
    else if (str[i] === "F" && str[i + 1] === "#") result += "J";
    else if (str[i] === "G" && str[i + 1] === "#") result += "K";
    else if (str[i] === "A" && str[i + 1] === "#") result += "L";
    else {
      result += str[i];
      i--;
    }
  }
  return result;
};

function solution(m, musicinfos) {
  var answer = "";
  let timeMaximum = 0;
  m = changeString(m); // '#'제거
  musicinfos.map((item) => {
    const arr = item.split(","); // ','을 기준으로 나눔
    const timeDiff = timeDiffFunc(arr[0], arr[1]); // 시간 차이 구하기
    arr[3] = changeString(arr[3]); // '#'제거
    const str = makeString(timeDiff, arr[3]); // time길이만큼 문자열 생성
    if (str.includes(m) && timeMaximum < timeDiff) {
      // 포함하고 시간을 따져서 answer를 정해줌
      answer = arr[2];
      timeMaximum = timeDiff;
    }
  });
  if (answer === "") answer = "(None)";
  return answer;
}
