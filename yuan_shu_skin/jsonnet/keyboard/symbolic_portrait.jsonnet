// 符号-竖屏
//
local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local keyboardLayout = import '../lib/keyboardLayout.libsonnet';
local others = import '../lib/others.libsonnet';
local utils = import '../lib/utils.libsonnet';

local createButton(params={}) =
  local isNumber = std.get(params, 'isNumber', false);
  local isLetter = std.get(params, 'isLetter', false);
  local isSymbolic = std.get(params, 'isSymbolic', false);

  std.prune({
    size: std.get(params, 'size'),
    bounds: std.get(params, 'bounds'),

    backgroundStyle:
      if isLetter then
        'alphabeticBackgroundStyle'
      else if isNumber then
        'numericBackgroundStyle'
      else if isSymbolic then
        'symbolicBackgroundStyle'
      else
        std.get(params, 'backgroundStyle', 'systemButtonBackgroundStyle'),

    foregroundStyle: std.get(params, 'foregroundStyle', params.key + 'ButtonForegroundStyle'),

    action: std.get(params, 'action', { character: params.key }),
    repeatAction: std.get(params, 'repeatAction'),

    // 动画
    animation: [
      'ButtonScaleAnimation',
    ],
  });

local keyboard(theme) =
  {
    local ButtonSize = keyboardLayout.getSymbolicButtonSize(theme),
    keyboardHeight: others['竖屏']['键盘总高度'],
    // "toolbarHeight": others["竖屏"]["toolbar高度"],
    keyboardLayout:
      [
        {
          HStack: {
            subviews: [
              { Cell: 'one_Button' },
              { Cell: 'two_Button' },
              { Cell: 'three_Button' },
              { Cell: 'four_Button' },
              { Cell: 'five_Button' },
              { Cell: 'six_Button' },
              { Cell: 'seven_Button' },
              { Cell: 'eight_Button' },
              { Cell: 'nine_Button' },
              { Cell: 'zero_Button' },
            ],
          },
        },
        {
          HStack: {
            subviews: [
              { Cell: 'exclamation_Button' },
              { Cell: 'at_sign_Button' },
              { Cell: 'pound_sign_Button' },
              { Cell: 'dollar_sign_Button' },
              { Cell: 'percent_sign_Button' },
              { Cell: 'caret_Button' },
              { Cell: 'ampersand_Button' },
              { Cell: 'star_Button' },
              { Cell: 'left_parentheses_Button' },
              { Cell: 'right_parentheses_Button' },
            ],
          },
        },
        {
          HStack: {
            subviews: [
              { Cell: 'left_brackets_Button' },
              { Cell: 'right_brackets_Button' },
              { Cell: 'left_braces_Button' },
              { Cell: 'right_braces_Button' },
              { Cell: 'backslash_Button' },
              { Cell: 'vertical_bar_Button' },
              { Cell: 'colon_Button' },
              { Cell: 'semicolon_Button' },
              { Cell: 'single_quote_Button' },
              { Cell: 'double_quote_Button' },
            ],
          },
        },
        {
          HStack: {
            subviews: [
              { Cell: 'shift_Button' },
              { Cell: 'less_than_sign_Button' },
              { Cell: 'greater_than_sign_Button' },
              { Cell: 'comma_Button' },
              { Cell: 'period_Button' },
              { Cell: 'question_mark_Button' },
              { Cell: 'forward_slash_Button' },
              { Cell: 'symbolbackspaceButton' },
            ],
          },
        },
        {
          HStack: {
            subviews: [
              { Cell: 'symbol_return_Button' },
              { Cell: 'hyphen_Button' },
              { Cell: 'underscore_Button' },
              { Cell: 'plus_Button' },
              { Cell: 'equals_sign_Button' },
              { Cell: 'spaceButton' },
              { Cell: 'enterButton' },
            ],
          },
        },
      ],
    keyboardStyle: {
      insets: {
        top: 3,
        bottom: 3,
        left: 4,
        right: 4,
      },
      backgroundStyle: 'keyboardBackgroundStyle',
    },
    keyboardBackgroundStyle: {
      buttonStyleType: 'geometry',
      normalColor: color[theme]['键盘背景颜色'],
    },

    // 普通字符键背景样式
    alphabeticBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 5, left: 3, bottom: 5, right: 3 },
        normalColor: color[theme]['字母键背景颜色-普通'],
        highlightColor: color[theme]['字母键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    // 数字键背景样式
    numericBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 4, left: 3, bottom: 4, right: 3 },
        normalColor: color[theme]['字母键背景颜色-普通'],
        highlightColor: color[theme]['字母键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    // 普通符号键背景样式
    symbolicBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 5, left: 3, bottom: 5, right: 3 },
        normalColor: color[theme]['字母键背景颜色-普通'],
        highlightColor: color[theme]['字母键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    // 系统功能键背景样式
    systemButtonBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 4, left: 3, bottom: 4, right: 3 },
        normalColor: color[theme]['功能键背景颜色-普通'],
        highlightColor: color[theme]['功能键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),

    // ================= 数字键 样式 ================
    one_Button: createButton(
      params={
        key: '1',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'one_ButtonForegroundStyle',
      }
    ),
    one_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '1',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    two_Button: createButton(
      params={
        key: '2',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'two_ButtonForegroundStyle',
      }
    ),
    two_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '2',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    three_Button: createButton(
      params={
        key: '3',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'three_ButtonForegroundStyle',
      }
    ),
    three_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '3',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    four_Button: createButton(
      params={
        key: '4',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'four_ButtonForegroundStyle',
      }
    ),
    four_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '4',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    five_Button: createButton(
      params={
        key: '5',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'five_ButtonForegroundStyle',
      }
    ),
    five_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '5',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    six_Button: createButton(
      params={
        key: '6',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'six_ButtonForegroundStyle',
      }
    ),
    six_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '6',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    seven_Button: createButton(
      params={
        key: '7',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'seven_ButtonForegroundStyle',
      }
    ),
    seven_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '7',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    eight_Button: createButton(
      params={
        key: '8',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'eight_ButtonForegroundStyle',
      }
    ),
    eight_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '8',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    nine_Button: createButton(
      params={
        key: '9',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'nine_ButtonForegroundStyle',
      }
    ),
    nine_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '9',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    zero_Button: createButton(
      params={
        key: '0',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: true,
        foregroundStyle: 'zero_ButtonForegroundStyle',
      }
    ),
    zero_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '0',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),
    // ================= 字符键 样式 ================
    exclamation_Button: createButton(
      params={
        key: '!',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'exclamation_ButtonForegroundStyle',
      }
    ),
    exclamation_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '!',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    at_sign_Button: createButton(
      params={
        key: '@',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'at_sign_ButtonForegroundStyle',
      }
    ),
    at_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '@',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    pound_sign_Button: createButton(
      params={
        key: '#',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'pound_sign_ButtonForegroundStyle',
      }
    ),
    pound_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '#',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    dollar_sign_Button: createButton(
      params={
        key: '$',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'dollar_sign_ButtonForegroundStyle',
      }
    ),
    dollar_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '$',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    percent_sign_Button: createButton(
      params={
        key: 'percent_sign',
        action: { character: '%' },
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'percent_sign_ButtonForegroundStyle',
      }
    ),
    percent_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '%',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    caret_Button: createButton(
      params={
        key: '^',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'caret_ButtonForegroundStyle',
      }
    ),
    caret_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '^',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    ampersand_Button: createButton(
      params={
        key: '&',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'ampersand_ButtonForegroundStyle',
      }
    ),
    ampersand_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '&',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    star_Button: createButton(
      params={
        key: '*',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'star_ButtonForegroundStyle',
      }
    ),
    star_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '*',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    left_parentheses_Button: createButton(
      params={
        key: '(',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'left_parentheses_ButtonForegroundStyle',
      }
    ),
    left_parentheses_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '(',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    right_parentheses_Button: createButton(
      params={
        key: ')',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'right_parentheses_ButtonForegroundStyle',
      }
    ),
    right_parentheses_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ')',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    left_brackets_Button: createButton(
      params={
        key: '[',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'left_brackets_ButtonForegroundStyle',
      }
    ),
    left_brackets_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '[',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    right_brackets_Button: createButton(
      params={
        key: ']',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'right_brackets_ButtonForegroundStyle',
      }
    ),
    right_brackets_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ']',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    left_braces_Button: createButton(
      params={
        key: 'left_braces',
        action: { character: '{' },
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'left_braces_ButtonForegroundStyle',
      }
    ),
    left_braces_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '{',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    right_braces_Button: createButton(
      params={
        key: '}',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'right_braces_ButtonForegroundStyle',
      }
    ),
    right_braces_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '}',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    backslash_Button: createButton(
      params={
        key: '\\',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'backslash_ButtonForegroundStyle',
      }
    ),
    backslash_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '\\',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    vertical_bar_Button: createButton(
      params={
        key: '|',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'vertical_bar_ButtonForegroundStyle',
      }
    ),
    vertical_bar_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '|',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    colon_Button: createButton(
      params={
        key: ':',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'colon_ButtonForegroundStyle',
      }
    ),
    colon_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ':',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    semicolon_Button: createButton(
      params={
        key: ';',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'semicolon_ButtonForegroundStyle',
      }
    ),
    semicolon_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ';',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    single_quote_Button: createButton(
      params={
        key: "'",
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'single_quote_ButtonForegroundStyle',
      }
    ),
    single_quote_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: "'",
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    double_quote_Button: createButton(
      params={
        key: '"',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'double_quote_ButtonForegroundStyle',
      }
    ),
    double_quote_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '"',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    shift_Button: createButton(
      params={
        key: 'shift',
        action: { shortcutCommand: '#中英切换' },
        size: std.get(ButtonSize, 'shift键size'),
        isLetter: false,
      },
    ),
    shiftButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'shift',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
      }
    ),

    less_than_sign_Button: createButton(
      params={
        key: '<',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'less_than_sign_ButtonForegroundStyle',
      }
    ),
    less_than_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '<',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    greater_than_sign_Button: createButton(
      params={
        key: '>',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'greater_than_sign_ButtonForegroundStyle',
      }
    ),
    greater_than_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '>',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    comma_Button: createButton(
      params={
        key: ',',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'comma_ButtonForegroundStyle',
      }
    ),
    comma_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ',',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    period_Button: createButton(
      params={
        key: '.',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'period_ButtonForegroundStyle',
      }
    ),
    period_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '.',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    question_mark_Button: createButton(
      params={
        key: '?',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'question_mark_ButtonForegroundStyle',
      }
    ),
    question_mark_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '?',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    forward_slash_Button: createButton(
      params={
        key: '/',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'forward_slash_ButtonForegroundStyle',
      }
    ),
    forward_slash_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '/',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    symbolbackspaceButton: createButton(
      params={
        key: 'symbolbackspace',
        size: std.get(ButtonSize, 'backspace键size'),
        action: 'backspace',
        repeatAction: 'backspace',
        isNumber: false,
        isLetter: false,
      }
    ),
    symbolbackspaceButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'delete.left',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
        center: { y: 0.53 },
      }
    ),

    symbol_return_Button: createButton(
      params={
        key: 'symbolreturn',
        size: std.get(ButtonSize, '返回键size'),
        action: 'returnLastKeyboard',
        isNumber: false,
      }
    ),
    symbolreturnButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: 'back',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    hyphen_Button: createButton(
      params={
        key: '-',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'hyphen_ButtonForegroundStyle',
      }
    ),
    hyphen_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '-',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    underscore_Button: createButton(
      params={
        key: '_',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'underscore_ButtonForegroundStyle',
      }
    ),
    underscore_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '_',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    plus_Button: createButton(
      params={
        key: '+',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'plus_ButtonForegroundStyle',
      }
    ),
    plus_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '+',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    equals_sign_Button: createButton(
      params={
        key: '=',
        size: std.get(ButtonSize, '普通键size'),
        isNumber: false,
        isLetter: false,
        isSymbolic: true,
        foregroundStyle: 'equals_sign_ButtonForegroundStyle',
      }
    ),
    equals_sign_ButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '=',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    spaceButton: createButton(
      params={
        key: 'space',
        size: std.get(ButtonSize, 'space键size'),
        backgroundStyle: 'alphabeticBackgroundStyle',
        foregroundStyle: [
          'spaceButtonForegroundStyle',
          'spaceButtonForegroundStyle2',
        ],
        action: 'space',
        isLetter: false,
        isSymbolic: true,
      }
    ),
    spaceButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: 'space',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    // 显示方案名
    spaceButtonForegroundStyle2: utils.makeTextStyle({
      text: 'char',
      fontSize: 8,
      center: { x: 0.17, y: 0.2 },
      normalColor: color[theme]['划动字符颜色'],
      highlightColor: color[theme]['划动字符颜色'],
    }),

    enterButton: createButton(
      params={
        key: 'enter',
        size: std.get(ButtonSize, 'enter键size'),
        action: 'enter',
        isLetter: false,
      }
    ) + {
      backgroundStyle: [
        {
          styleName: 'systemButtonBackgroundStyle',
          conditionKey: '$returnKeyType',
          conditionValue: [0, 2, 3, 5, 8, 10, 11],
        },
        {
          styleName: 'enterButtonBlueBackgroundStyle',
          conditionKey: '$returnKeyType',
          conditionValue: [1, 4, 6, 7, 9],
        },
      ],
      foregroundStyle: [
        {
          styleName: 'enterButtonForegroundStyle0',
          conditionKey: '$returnKeyType',
          conditionValue: [0, 2, 3, 5, 8, 10, 11],
        },
        {
          styleName: 'enterButtonForegroundStyle14',
          conditionKey: '$returnKeyType',
          conditionValue: [1, 4],
        },
        {
          styleName: 'enterButtonForegroundStyle6',
          conditionKey: '$returnKeyType',
          conditionValue: [6],
        },
        {
          styleName: 'enterButtonForegroundStyle7',
          conditionKey: '$returnKeyType',
          conditionValue: [7],
        },
        {
          styleName: 'enterButtonForegroundStyle9',
          conditionKey: '$returnKeyType',
          conditionValue: [9],
        },
      ],
      action: 'enter',

      // 按键通知
      notification: [
        'garyReturnKeyTypeNotification',
        'blueReturnKeyTypeNotification14',
        'blueReturnKeyTypeNotification6',
        'blueReturnKeyTypeNotification7',
        'blueReturnKeyTypeNotification9',
      ],
    },

    enterButtonForegroundStyle0: utils.makeTextStyle(
      params={
        text: '回车',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),
    enterButtonForegroundStyle6: utils.makeTextStyle(
      params={
        text: '搜索',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle7: utils.makeTextStyle(
      params={
        text: '发送',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle14: utils.makeTextStyle(
      params={
        text: '前往',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle9: utils.makeTextStyle(
      params={
        text: '完成',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonBlueBackgroundStyle: utils.makeGeometryStyle(
      params={
        buttonStyleType: 'geometry',
        insets: { top: 5, left: 3, bottom: 5, right: 3 },
        normalColor: color[theme]['enter键背景(蓝色)'],
        highlightColor: color[theme]['功能键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    // 灰色回车通知（前景 0）
    garyReturnKeyTypeNotification: {
      notificationType: 'returnKeyType',
      returnKeyType: [0, 2, 3, 5, 8, 10, 11],
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle0',
    },

    // 蓝色回车通知（按前景细分）
    blueReturnKeyTypeNotification14: {
      notificationType: 'returnKeyType',
      returnKeyType: [1, 4],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle14',
    },
    blueReturnKeyTypeNotification6: {
      notificationType: 'returnKeyType',
      returnKeyType: [6],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle6',
    },
    blueReturnKeyTypeNotification7: {
      notificationType: 'returnKeyType',
      returnKeyType: [7],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle7',
    },
    blueReturnKeyTypeNotification9: {
      notificationType: 'returnKeyType',
      returnKeyType: [9],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle9',
    },

    ButtonScaleAnimation: animation['26键按键动画'],
  };
{
  new(theme): keyboard(theme) + collectionData.symbolicDataSource,  // 符号数据源
  getKeyboard(theme): keyboard(theme),  // 给emoji键盘使用，提供无符号数据源的键盘配置
}
