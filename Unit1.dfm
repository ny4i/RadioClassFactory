object Form1: TForm1
  Left = 192
  Top = 130
  Width = 1305
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 104
    Top = 72
    Width = 137
    Height = 33
    Caption = 'Create TRadio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 128
    Width = 137
    Height = 33
    Caption = 'Set Frequency'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 528
    Top = 72
    Width = 569
    Height = 425
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button3: TButton
    Left = 112
    Top = 216
    Width = 129
    Height = 41
    Caption = 'Free TRadio'
    TabOrder = 3
    OnClick = Button3Click
  end
  object RadioGroup1: TRadioGroup
    Left = 296
    Top = 64
    Width = 137
    Height = 81
    Caption = 'RadioGroup1'
    Items.Strings = (
      'K4'
      'Flex')
    TabOrder = 4
  end
end
