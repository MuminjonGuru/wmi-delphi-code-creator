object FrmWmiMethodsContainer: TFrmWmiMethodsContainer
  Left = 326
  Top = 122
  Caption = 'FrmWmiMethodsContainer'
  ClientHeight = 637
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 1289
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 26
    Width = 1289
    Height = 611
    Align = alClient
    TabOrder = 1
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionNew
            Caption = '&New'
            ImageIndex = 2
          end
          item
            Action = ActionDelete
            Caption = '&Delete'
            ImageIndex = 3
          end>
        ActionBar = ActionToolBar1
      end>
    Images = ImageList1
    Left = 192
    Top = 120
    StyleName = 'Platform Default'
    object ActionNew: TAction
      Caption = 'New'
      ImageIndex = 2
      OnExecute = ActionNewExecute
    end
    object ActionDelete: TAction
      Caption = 'Delete'
      ImageIndex = 3
      OnExecute = ActionDeleteExecute
      OnUpdate = ActionDeleteUpdate
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Left = 208
    Top = 248
    Bitmap = {
      494C010104000900080010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000043A12B7045018FF055019FF055019FF055019FF043913B50000
      000000000000000000000000000000000000000000000000000000001D5A0000
      53FA00001F5B0000000100000000000000000000000000000000000000010000
      1C49000061F90000225A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000045018FF0C952EFF08AC32FF08AC32FF0C952EFF055019FF0000
      0000000000000000000000000000000000000000000000001F5E000066FF0505
      A1FF00006FFF0000235F000000010000000000000000000000010000214C0101
      7EFF0B0BB8FF000079FF0000265E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000045018FF0B982FFF04C434FF04C534FF0B982FFF055019FF0000
      00000000000000000000000000000000000000001B5A000062FF04049EFF0909
      AFFF0B0BB2FF010177FF0000265F00000001000000010000224C020287FF1313
      C9FF1313C2FF0C0CB8FF000079FF0000225A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000045018FF0C9B2EFF03CC34FF02CF34FF0C9C2EFF055019FF0000
      00000000000000000000000000000000000000004BF9020296FF0505A7FF0B0B
      B3FF1212BFFF1111C1FF010180FF0000265F0000214C00008CFF1818D9FF1D1D
      D4FF1717C9FF1111BEFF0909B4FF000062FB00000006000000160000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A0000001A000000160000000600000006000000160000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A0000001A00000016000000060000000000000000000000000000
      000000000000045018FF0A9E30FF01D636FF01D836FF0A9F30FF045018FF0000
      00000000000000000000000000000000000000001A56000063FE0606A3FF0E0E
      B7FF1313C3FF1B1BD1FF1414D0FF010185FF00008AFF1D1DE6FF2626E8FF2020
      DAFF1A1ACFFF0E0EC1FF000081FF0000235B0707075B0A0A0A750A0A0A750A0A
      0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A
      0A750A0A0A750A0A0A750A0A0A750707075B0707075B0A0A0A750A0A0A750A0A
      0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A0A750A0A
      0A750A0A0A750A0A0A750A0A0A750707075B043911B5035017FF035017FF0350
      17FF045018FF045018FF0A9E2FFF01DA36FF00DF35FF0BA02FFF045018FF0450
      18FF055019FF055019FF055019FF043A12B30000000000001E59000069FF0909
      AEFF1414C5FF1B1BD2FF2222E1FF1818D8FF1F1FE7FF3030F9FF2727EAFF2121
      DDFF1010CEFF000086FF0000295F0000000119191970F0F0F0FFF0F0F0FFECEC
      ECFFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
      E8FFECECECFFF0F0F0FFF0F0F0FF1919197019191970F0F0F0FFF0F0F0FFECEC
      ECFFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
      E8FFECECECFFF0F0F0FFF0F0F0FF1919197006551CFA3EA858FF33A44FFF2BA3
      48FF189E38FF0A9B2DFF09AC30FF01D334FF01D636FF09AF32FF099C2EFF0B99
      2EFF0A952FFF0C942DFF0C912EFF07571DFB0000000000000000000021590000
      6EFF0C0CB7FF1B1BD0FF2121DDFF2626E9FF2C2CF2FF2B2BF1FF2626E7FF1313
      D6FF00008CFF00002B5F0000000100000000171717532121216E2121216EEBEB
      EBFFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFEBEBEBFF2121216E2121216E17171753171717532121216E2121216EEBEB
      EBFFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFEBEBEBFF2121216E2121216E17171753055A1CFF5DBD75FF4BBC67FF3EBF
      60FF34C357FF12C13EFF02C432FF03C933FF02CA35FF03C733FF04C232FF05BA
      33FF07B231FF08A731FF0B9B30FF085C1FFF0000000000000000000000000000
      1F59000071FF0C0CBCFF1C1CD5FF2121DFFF2525E5FF2424E3FF1313D2FF0000
      8BFF00002A5F00000001000000000000000000000000000000002323236CEFEF
      EFFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEFEFEFFF2323236C000000000000000000000000000000002323236CEFEF
      EFFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
      EAFFEFEFEFFF2323236C0000000000000000045A1BFF70C385FF5CBF75FF50C1
      6CFF45C364FF3BC75DFF1CC245FF03BF31FF04BF32FF04BF32FF05BA32FF06B4
      31FF07AC30FF09A32FFF0B9930FF085C1FFF0000000000000000000000000000
      1F5903036FFF3737C6FF2020CEFF1A1AD3FF1D1DD7FF1E1ED7FF1313CDFF0101
      8AFF0000296600000002000000000000000000000000000000002828286BF4F4
      F4FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF4F4F4FF2828286B000000000000000000000000000000002828286BF4F4
      F4FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF4F4F4FF2828286B000000000000000004561AFB60B776FF56B26DFF4CB0
      65FF44AF5FFF3BAC57FF3DB75CFF2EC253FF13BB3DFF09A630FF0A9A2EFF0A9A
      2EFF0C952FFF0B932DFF0D932EFF08581DFB000000000000000000001E590404
      6CFF4A4AC4FF4C4CCDFF4949D0FF2F2FCDFF1717CAFF1717CAFF1515C8FF0F0F
      C2FF010184FF00002966000000020000000000000000000000002B2B2B6AF8F8
      F8FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF65A3
      61FF358631FF1D511AC4000000000000000000000000000000002B2B2B6AF8F8
      F8FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF8F8F8FF2B2B2B6A0000000000000000023910B5035017FF035017FF0350
      17FF035017FF035017FF3EAD59FF44C163FF39BD5AFF27A346FF045018FF0450
      18FF045018FF045018FF045018FF043C12B70000000000001C59050565FF5858
      C0FF5959C6FF5353C7FF5050CBFF4343C4FF3D3DC5FF3030C7FF1C1CBEFF0F0F
      B6FF0808B0FF00007BFF000027660000000200000000000000002D2D2D68FCFC
      FCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFF3B9B
      31FF2ADF19FF137209E1000000000000000000000000000000002D2D2D68FCFC
      FCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFCFCFCFF2D2D2D6800000000000000000000000000000000000000000000
      000000000000035017FF4CB065FF54BF6FFF4ABB65FF31A54FFF045018FF0000
      0000000000000000000000000000000000000000175607075DFE6868C1FF6868
      C4FF6060C2FF5E5EC6FF5555C5FF040474FF050573FF4343C4FF4141C1FF3636
      BAFF2C2CB2FF2222AFFF020274FF0000216100000000000000002A2A2A5AC0C0
      C0D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DBB65FF3DA332FF3DA3
      32FF3CE22BFF147A09DF0B7000CC0755009900000000000000002A2A2A5AC0C0
      C0D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6565B4FF323299FF3232
      99FF26268DF609096EDF000066CC00004F990000000000000000000000000000
      000000000000035017FF59B36EFF65BF7BFF59B971FF3EA758FF035017FF0000
      00000000000000000000000000000000000000003EF06A6AB9FF8181CFFF7373
      C8FF6E6EC6FF6565C2FF070770FF0000215F00002159050572FF4646BCFF3F3F
      B5FF3434AFFF2F2FABFF2323A6FF000053FB0000000000000000111111222B2B
      2B59333333663333336633333366333333663333336616810BE051E740FF51E7
      40FF51E740FF51E740FF51E740FF0C7700CC0000000000000000111111222B2B
      2B5933333366333333663333336633333366333333660B0B83E05D5DF7FF5D5D
      F7FF5D5DF7FF5D5DF7FF5D5DF7FF00007ACC0000000000000000000000000000
      000000000000035017FF64B87AFF75BF89FF6BBA80FF4AA962FF035017FF0000
      00000000000000000000000000000000000000001552090957FE8080C3FF8888
      CFFF7777C4FF090968FF0000215F00000001000000000000215906066CFF4949
      B6FF4343B3FF3A3AABFF040467FF00001D590000000000000000000000000000
      000000000000000000000000000000000000000000000A5E00990E7E00CC0E7E
      00CC65EB54FF0E7E00CC0E7E00CC0A5E00990000000000000000000000000000
      0000000000000000000000000000000000000000000000006499000086CC0000
      86CC000086CC000086CC000086CC000064990000000000000000000000000000
      000000000000025016FF74BE87FF90CC9FFF84C695FF58B06EFF035017FF0000
      0000000000000000000000000000000000000000000000001757070758FE7575
      BCFF0B0B62FF00001E5F0000000100000000000000000000000000001F590505
      66FE4141ACFF060666FF00001F5E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F83
      00CC74EE63FF0F8300CC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000023A11B706571BFC085C1EFF085C1EFF06571BFB043911B50000
      0000000000000000000000000000000000000000000000000000000015520000
      3FF10000195B0000000100000000000000000000000000000000000000000000
      1A55000049F600001B5800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000D65
      0099108700CC0D65009900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FC3C3FFFFFFFFF81F8181FFFFFFFF
      F81F0000FFFFFFFFF81F000000000000F81F0000000000000000800000000000
      0000C001000000000000E003C003C0030000E003C003C0030000C001C003C003
      00008000C003C003F81F0000C000C000F81F0000C000C000F81F0080FF80FF80
      F81F81C1FFE3FFFFF81FC3E3FFE3FFFF00000000000000000000000000000000
      000000000000}
  end
end
