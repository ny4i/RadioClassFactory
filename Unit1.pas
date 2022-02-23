unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
   TRadioType = (rtK4, rtFlex, rtOmniRig);
   TRadio = class
     private
        frequency: integer;
        mode: integer;
     public
        Constructor Create; 
        Destructor Destroy; override;
        class function CreateRadio(radioType: TRadioType): TRadio;
        procedure SetFrequency(hz: integer); virtual; Abstract;
        procedure SetMode(mode: integer); virtual; Abstract;
     end;
     
  TK4Radio = class(TRadio)
     private
     public
        Constructor Create;
        Destructor Destroy; override;
        procedure SetFrequency(hz: integer);  override;
        procedure SetMode(mode: integer); override;
  end;

  TFlexRadio = class(TRadio)
     private
     public
        Constructor Create;
        Destructor Destroy;   override;
        procedure SetFrequency(hz: integer); override;
        procedure SetMode(mode: integer);  override;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
     radio: TRadio;
    { Public declarations }
  end;

procedure Status(s: string);


var
  Form1: TForm1;

implementation



{$R *.dfm}

constructor TRadio.Create;
begin
   Status('In TRadio.Create');
end;

Destructor TRadio.Destroy;
begin
   Status('In TRadio.Destroy');
end;


class function TRadio.CreateRadio(radioType: TRadioType): TRadio;
begin
   case radioType of
      rtK4:   result := TK4Radio.Create;
      rtFlex: result := TFlexRadio.Create;
      else
         Result := nil;
      end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var t: TRadioType;
begin
   case RadioGroup1.ItemIndex of
      0: t := rtK4;
      1: t := rtFlex;
      else
         begin
         Status('Radio type must be selected');
         exit;
         end;
   end;
   Status('Calling class factor to create ' + RadioGroup1.Items.Strings[RadioGroup1.ItemIndex] + ' radio object');
   radio := TRadio.CreateRadio(t);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   FreeAndNil(radio);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if radio <> nil then
      begin
      radio.SetFrequency(14000000);
      end;
end;

constructor TFlexRadio.Create;
begin
   Status('In TFlexRadio.Create');
   inherited Create;
end;

Destructor TFlexRadio.Destroy;
begin
   Status('In TFlexRadio.Destroy');
   Inherited Destroy;
end;

procedure TFlexRadio.SetFrequency(hz: integer);
begin
   Status('In TFlexRadio.SetFrequency');
   Self.frequency := hz;
end;

procedure TFlexRadio.SetMode(mode: integer);
begin
   Status('In TFlexRadio.SetMode');
   Self.mode := mode;
end;

constructor TK4Radio.Create;
begin
   Status('In TK4Radio.Create');
   inherited Create;
end;

Destructor TK4Radio.Destroy;
begin
   Status('In TK4Radio.Destroy');
   Inherited Destroy;
end;

procedure TK4Radio.SetFrequency(hz: integer);
begin
   Status('In TK4Radio.SetFrequency');
end;

procedure TK4Radio.SetMode(mode: integer);
begin
   Status('In TK4Radio.SetMode');
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
   Status('Freeing radio object');
   FreeAndNil(radio);
end;

procedure Status(s: string);
begin
   Form1.Memo1.Lines.Add(s);
end;
end.
