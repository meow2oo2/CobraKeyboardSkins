// js.libsonnet
{
  // 中英切换
  js_ascii_mode: {
    text: |||
      // JavaScript
      function getText() {
        return $getRimeOptionState("ascii_mode") ? "英" : "中";
      }
    |||,
  },

  // 简繁切换

  // prediction预测

  // comment注释回显

  // 编码回显
  js_getRimePreedit: {
    text: |||
      // JavaScript
      function getText() {
        return $getRimePreedit();
      }
    |||,
  },

  // 候选回显
  js_candidates: {
    text: |||
      // JavaScript
      function getText() {
        const candidates = $getRimeCandidates();
        if (candidates && candidates.length > 0) {
          return candidates[0].text;
        }
        const preedit = $getRimePreedit();
        return preedit;
      }
    |||,
  },

  // 编码候选回显
  js_preedit_candidates: {
    text: |||
      // JavaScript
      function getText() {
        const { preedit, candidates } = { preedit: $getRimePreedit(), candidates: $getRimeCandidates() };
        const candidateText = candidates.length > 0 ? candidates[0].text : '';
        return candidateText ? `${preedit}\\n${candidateText}` : preedit;
      }
    |||,
  },

  // 回车键背景
  js_enterbackgroundStyle: {
    backgroundStyle: |||
      // JavaScript
      function getText() {
        let type = $getReturnKeyType();
        if (type === 1 || type === 4 || type === 7 || type === 9) {
          return "blueSystemButtonBackgroundStyle";
        }
        return "systemButtonBackgroundStyle";
      }
    |||,
  },

  // 回车键前景判断
  js_enterforegroundStyle: {
    foregroundStyle: |||
      // JavaScript
      function getText() {
        let type = $getReturnKeyType();
        if (type === 1 || type === 4 || type === 7 || type === 9) {
          return "enterButtonWhiteForegroundStyle";
        }
        return "enterButtonBlackForegroundStyle";
      }
    |||,
  },

  // 回车键未上屏显示判断
  js_enterpreeditStateForegroundStyle: {
    preeditStateForegroundStyle: |||
      // JavaScript
      function getText() {
        let type = $getReturnKeyType();
        if (type === 1 || type === 4 || type === 7 || type === 9) {
          return "enterpreeditStateWhiteForegroundStyle";
        }
        return "enterpreeditStateBlackForegroundStyle";
      }
    |||,
  },

  // 回车键未上屏显示判断-搜索➡确认
  js_enterpreeditStatetextStyle: {
    text: |||
      // JavaScript
      function getText() {
        const type = $getReturnKeyType();
        switch (type) {
          case 1:
            return "前往";
          case 2:
            return "搜索";
          case 3:
            return "加入";
          case 4:
            return "确认";
          case 5:
            return "出发";
          case 6:
            return "确认";
          case 7:
            return "发送";
          case 8:
            return "搜索";
          case 9:
            return "完成";
          case 10:
            return "呼叫";
          case 11:
            return "继续";
          default:
            return "换行";
        }
      }
    |||,
  },

  // 回车键建议显示文字
  js_entertextStyle: {
    text: |||
      // JavaScript
      function getText() {
        const type = $getReturnKeyType();
        switch (type) {
          case 1:
            return "前往";
          case 2:
            return "搜索";
          case 3:
            return "加入";
          case 4:
            return "确认";
          case 5:
            return "出发";
          case 6:
            return "搜索";
          case 7:
            return "发送";
          case 8:
            return "搜索";
          case 9:
            return "完成";
          case 10:
            return "呼叫";
          case 11:
            return "继续";
          default:
            return "换行";
        }
      }
    |||,
  },
}



