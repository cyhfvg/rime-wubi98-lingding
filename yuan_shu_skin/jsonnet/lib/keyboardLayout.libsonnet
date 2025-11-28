local color = import 'color.libsonnet';
local keyboardLayout(theme='light') = {
  '竖屏中文26键': {
    keyboardLayout: [
      {
        HStack: {
          subviews: [
            { Cell: 'qButton' },
            { Cell: 'wButton' },
            { Cell: 'eButton' },
            { Cell: 'rButton' },
            { Cell: 'tButton' },
            { Cell: 'yButton' },
            { Cell: 'uButton' },
            { Cell: 'iButton' },
            { Cell: 'oButton' },
            { Cell: 'pButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: 'aButton' },
            { Cell: 'sButton' },
            { Cell: 'dButton' },
            { Cell: 'fButton' },
            { Cell: 'gButton' },
            { Cell: 'hButton' },
            { Cell: 'jButton' },
            { Cell: 'kButton' },
            { Cell: 'lButton' },
            { Cell: 'mButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: 'shiftButton' },
            // { Cell: 'zButton' },
            { Cell: 'xButton' },
            { Cell: 'cButton' },
            { Cell: 'vButton' },
            { Cell: 'bButton' },
            { Cell: 'nButton' },
            // { Cell: 'mButton' },
            { Cell: 'backspaceButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            // { Cell: 'symbolButton' },
            { Cell: '123Button' },
            { Cell: 'spaceButton' },
            // { Cell: 'spaceRightButton' },
            { Cell: 'zButton' },
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
  },

  '横屏中文26键': {
    keyboardLayout: [
      {
        VStack: {
          style: 'columnStyle1',
          subviews: [
            {
              HStack: {
                subviews: [
                  { Cell: 'qButton' },
                  { Cell: 'wButton' },
                  { Cell: 'eButton' },
                  { Cell: 'rButton' },
                  { Cell: 'tButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'aButton' },
                  { Cell: 'sButton' },
                  { Cell: 'dButton' },
                  { Cell: 'fButton' },
                  { Cell: 'gButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'shiftButton' },
                  { Cell: 'zButton' },
                  { Cell: 'xButton' },
                  { Cell: 'cButton' },
                  { Cell: 'vButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'symbolButton' },
                  { Cell: '123Button' },
                  { Cell: 'spaceButton' },
                ],
              },
            },
          ],
        },
      },
      {
        VStack: {
          style: 'columnStyle2',
        },
      },
      {
        VStack: {
          style: 'columnStyle3',
          subviews: [
            {
              HStack: {
                subviews: [
                  { Cell: 'yButton' },
                  { Cell: 'uButton' },
                  { Cell: 'iButton' },
                  { Cell: 'oButton' },
                  { Cell: 'pButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'gButton' },
                  { Cell: 'hButton' },
                  { Cell: 'jButton' },
                  { Cell: 'kButton' },
                  { Cell: 'lButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'vButton' },
                  { Cell: 'bButton' },
                  { Cell: 'nButton' },
                  { Cell: 'mButton' },
                  { Cell: 'backspaceButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'spaceButton' },
                  { Cell: 'spaceRightButton' },
                  { Cell: 'enterButton' },
                ],
              },
            },
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
    columnStyle1: {
      size: {
        width: '2/5',
      },
    },
    columnStyle2: {
      size: {
        width: '1/5',
      },
    },
    columnStyle3: {
      size: {
        width: '2/5',
      },
    },
  },

  '竖屏英文26键': {
    keyboardLayout: [
      {
        HStack: {
          subviews: [
            { Cell: 'qButton' },
            { Cell: 'wButton' },
            { Cell: 'eButton' },
            { Cell: 'rButton' },
            { Cell: 'tButton' },
            { Cell: 'yButton' },
            { Cell: 'uButton' },
            { Cell: 'iButton' },
            { Cell: 'oButton' },
            { Cell: 'pButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: 'aButton' },
            { Cell: 'sButton' },
            { Cell: 'dButton' },
            { Cell: 'fButton' },
            { Cell: 'gButton' },
            { Cell: 'hButton' },
            { Cell: 'jButton' },
            { Cell: 'kButton' },
            { Cell: 'lButton' },
            { Cell: 'mButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: 'shiftButton' },
            { Cell: 'xButton' },
            { Cell: 'cButton' },
            { Cell: 'vButton' },
            { Cell: 'bButton' },
            { Cell: 'nButton' },
            { Cell: 'backspaceButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: '123Button' },
            { Cell: 'spaceButton' },
            // { Cell: 'spaceRightButton' },
            // {
            //   "Cell": "EnZhButton"
            // },
            { Cell: 'zButton' },
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
  },

  '横屏英文26键': {
    keyboardLayout: [
      {
        VStack: {
          style: 'columnStyle1',
          subviews: [
            {
              HStack: {
                subviews: [
                  { Cell: 'qButton' },
                  { Cell: 'wButton' },
                  { Cell: 'eButton' },
                  { Cell: 'rButton' },
                  { Cell: 'tButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'aButton' },
                  { Cell: 'sButton' },
                  { Cell: 'dButton' },
                  { Cell: 'fButton' },
                  { Cell: 'gButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'shiftButton' },
                  { Cell: 'zButton' },
                  { Cell: 'xButton' },
                  { Cell: 'cButton' },
                  { Cell: 'vButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'symbolButton' },
                  { Cell: '123Button' },
                  { Cell: 'spaceButton' },
                ],
              },
            },
          ],
        },
      },
      {
        VStack: {
          style: 'columnStyle2',
        },
      },
      {
        VStack: {
          style: 'columnStyle3',
          subviews: [
            {
              HStack: {
                subviews: [
                  { Cell: 'yButton' },
                  { Cell: 'uButton' },
                  { Cell: 'iButton' },
                  { Cell: 'oButton' },
                  { Cell: 'pButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'gButton' },
                  { Cell: 'hButton' },
                  { Cell: 'jButton' },
                  { Cell: 'kButton' },
                  { Cell: 'lButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'vButton' },
                  { Cell: 'bButton' },
                  { Cell: 'nButton' },
                  { Cell: 'mButton' },
                  { Cell: 'backspaceButton' },
                ],
              },
            },
            {
              HStack: {
                subviews: [
                  { Cell: 'spaceButton' },
                  { Cell: 'spaceRightButton' },
                  {
                    Cell: 'EnZhButton',
                  },
                  { Cell: 'enterButton' },
                ],
              },
            },
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
    columnStyle1: {
      size: {
        width: '2/5',
      },
    },
    columnStyle2: {
      size: {
        width: '1/5',
      },
    },
    columnStyle3: {
      size: {
        width: '2/5',
      },
    },
  },

  '竖屏按键尺寸': {
    '普通键size': {
      width: {
        percentage: 0.1,
      },
    },
    't键size': {
      width: '200/784',
    },
    'y键size': {
      width: '200/784',
    },
    'a键size': {
      width: {
        percentage: 0.15,
      },
    },
    'a键bounds': {
      width: '2/3',
      alignment: 'right',
    },
    'l键size': {
      width: {
        percentage: 0.15,
      },
    },
    'l键bounds': {
      width: '2/3',
      alignment: 'left',
    },
    'shift键size': {
      width: {
        percentage: 0.20,
      },
    },
    'backspace键size': {
      width: {
        percentage: 0.30,
      },
    },
    'symbol键size': {
      width: {
        percentage: 0.15,
      },
    },
    '123键size': {
      width: {
        percentage: 0.2,
      },
    },
    'space键size': {
      width: {
        percentage: 0.5,
      },
    },
    'spaceRight键size': {
      width: {
        percentage: 0.1,
      },
    },
    'enter键size': {
      width: {
        percentage: 0.2,
      },
    },
  },

  '横屏按键尺寸': {
    '普通键size': {
      width: '146/784',
    },
    't键size': {
      width: '200/784',
    },
    't键bounds': {
      width: '146/200',
      alignment: 'left',
    },
    'y键size': {
      width: '200/784',
    },
    'y键bounds': {
      width: '146/200',
      alignment: 'right',
    },
    'a键size': {
      width: '200/784',
    },
    'a键bounds': {
      width: '146/200',
      alignment: 'right',
    },
    'l键size': {
      width: '200/784',
    },
    'l键bounds': {
      width: '146/200',
      alignment: 'left',
    },
    'shift键size': {
      width: '200/784',
    },
    'backspace键size': {
      width: '200/784',
    },
    'symbol键size': {
      width: '173/784',
    },
    '123键size': {
      width: '173/784',
    },
    'space键size': {
      width: '438/784',
    },
    'spaceRight键size': {
      width: '173/784',
    },
    'enter键size': {
      width: '173/784',
    },
  },

  'symbolic按键尺寸': {

    '普通键size': {
      width: {
        percentage: 0.1,
      },
    },

    '返回键size': {
      width: {
        percentage: 0.2,
      },
    },

    'shift键size': {
      width: {
        percentage: 0.10,
      },
    },

    'lock键size': {
      width: {
        percentage: 0.10,
      },
    },

    'backspace键size': {
      width: {
        percentage: 0.10,
      },
    },

    'space键size': {
      width: {
        percentage: 0.2,
      },
    },
    'enter键size': {
      width: {
        percentage: 0.2,
      },
    },
  },
};

{
  getPinyinLayout(theme, orientation):
    if orientation == 'portrait' then keyboardLayout(theme)['竖屏中文26键']
    else keyboardLayout(theme)['横屏中文26键'],

  getEnLayout(theme, orientation):
    if orientation == 'portrait' then keyboardLayout(theme)['竖屏英文26键']
    else keyboardLayout(theme)['横屏英文26键'],

  getButtonSize(theme, orientation):
    if orientation == 'portrait' then keyboardLayout(theme)['竖屏按键尺寸']
    else keyboardLayout(theme)['横屏按键尺寸'],

  getSymbolicButtonSize(theme):
    keyboardLayout(theme)['symbolic按键尺寸'],
}
