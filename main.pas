unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxContainer,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TForm1 = class(TForm)
    PanelBetType: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PanelInputs: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    editLayOdds: TcxSpinEdit;
    Panel5: TPanel;
    Label3: TLabel;
    editBackOdds: TcxSpinEdit;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    stContentNormal: TcxStyle;
    ActionList1: TActionList;
    actComm2: TAction;
    actComm5: TAction;
    actModeQualifier: TAction;
    actModeSnr: TAction;
    actModeSr: TAction;
    PanelStake: TPanel;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    actStake5: TAction;
    actStake10: TAction;
    actStake25: TAction;
    actStake50: TAction;
    actStakeCustom: TAction;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    editStake: TcxSpinEdit;
    stContentGreen: TcxStyle;
    stContentRed: TcxStyle;
    stHeaderGrey: TcxStyle;
    stHeader: TcxStyle;
    stCenterRow: TcxStyle;
    stCenterRed: TcxStyle;
    stCenterGreen: TcxStyle;
    panelSummary: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cxButton11: TcxButton;
    actComm0: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    cxButton12: TcxButton;
    cxButton13: TcxButton;
    cxButton14: TcxButton;
    cxGrid1: TcxGrid;
    GridView: TcxGridTableView;
    colLayOdds: TcxGridColumn;
    colStake: TcxGridColumn;
    colRisk: TcxGridColumn;
    colProfitLoss: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure actComm2Execute(Sender: TObject);
    procedure actComm2Update(Sender: TObject);
    procedure actModeQualifierExecute(Sender: TObject);
    procedure actModeQualifierUpdate(Sender: TObject);
    procedure actStake5Execute(Sender: TObject);
    procedure actStake5Update(Sender: TObject);
    procedure editBackOddsEditing(Sender: TObject; var CanEdit: Boolean);
    procedure editBackOddsPropertiesChange(Sender: TObject);
    procedure GridViewCellClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure colProfitLoVssStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure editLayOddsPropertiesChange(Sender: TObject);
  private type
    TCalcMode = (cmQualifier, cmFreeSNR, cmFreeSR);
    TResult = record
      ProfitLoss: double;
      LayStake: double;
      Risk: double;
    end;
  private
    FComm: Integer;
    FStake: Integer;
    FMode: TCalcMode;
    procedure Recalc;
    procedure AddRow(RowIndex: Integer; LayOdds: double; Result: TResult);
    function GetStep(LayOdds: double): double;
    function Calc(Mode: TCalcMode; BackOdds, LayOdds: double; BackStake: Integer; Comm: Integer): TResult;
    function GetProfitLoss(Rec: TcxCustomGridRecord): Double;
    function GetValue(Rec: TcxCustomGridRecord; Index: Integer): Double;
    procedure SelectStyle(Rec: TcxCustomGridRecord; Red, Zero, Green: TcxStyle; var Style: TcxStyle);
    procedure UpdateSummary;
  public
  end;

var
  Form1: TForm1;

implementation

uses
  Clipbrd;

const
  LayOddsDepth = 24;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FComm := actComm5.Tag;
  FMode := cmQualifier;
  FStake := 5;
  actModeQualifier.Tag := Integer(cmQualifier);
  actModeSnr.Tag := Integer(cmFreeSNR);
  actModeSr.Tag := Integer(cmFreeSR);
  Recalc;
  editLayOdds.Properties.Increment := GetStep(editLayOdds.Value);
end;

function TForm1.GetProfitLoss(Rec: TcxCustomGridRecord): Double;
var
  V: Variant;
begin
  V :=  Rec.Values[colProfitLoss.Index];
  if VarIsNull(V) then
    Result := 0
  else
    Result := V;
end;

function TForm1.GetStep(LayOdds: double): double;
begin
  if LayOdds < 2 then
    Result := 0.01
  else
    Result := 0.1;
end;

function TForm1.GetValue(Rec: TcxCustomGridRecord; Index: Integer): Double;
begin
  if VarIsNull(Rec.Values[Index]) then
    Result := 0
  else
    Result := Rec.Values[Index];
end;

procedure TForm1.actComm2Execute(Sender: TObject);
begin
  FComm := TAction(Sender).Tag;
  Recalc;
end;

procedure TForm1.actComm2Update(Sender: TObject);
var
  Act: TAction;
begin
  Act := TAction(Sender);
  Act.Checked := FComm = Act.Tag;
end;

procedure TForm1.actModeQualifierExecute(Sender: TObject);
begin
  FMode := TCalcMode(TAction(Sender).Tag);
  Recalc;
end;

procedure TForm1.actModeQualifierUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FMode = TCalcMode(TAction(Sender).Tag);
end;

procedure TForm1.actStake5Execute(Sender: TObject);
begin
  FStake := TAction(Sender).Tag;
  editStake.Enabled := FStake = 0;
  Recalc;
end;

procedure TForm1.actStake5Update(Sender: TObject);
begin
  TAction(Sender).Checked := FStake = TAction(Sender).Tag;
end;

procedure TForm1.AddRow(RowIndex: Integer; LayOdds: double; Result: TResult);
begin

end;

function TForm1.Calc(Mode: TCalcMode; BackOdds, LayOdds: double; BackStake, Comm: Integer): TResult;
var
  BackReturn, LayCommPc, BackSum: double;

  function ToFixed(Value: double): double;
  begin
    Result := Round(Value * 100) / 100;
  end;

begin
  LayCommPc := Comm / 100;
  case FMode of
    cmQualifier:
      begin
        BackReturn := BackOdds * BackStake;
        BackSum := BackStake;
      end;
    cmFreeSNR:
      begin
        BackReturn := (BackOdds - 1) * BackStake;
        BackSum := 0;
      end;
    else
      raise ENotImplemented.Create('Not implemented');
  end;
  Result.LayStake := ToFixed(BackReturn / (LayOdds - LayCommPc));
  Result.Risk := ToFixed(Result.LayStake * (LayOdds - 1));
  Result.ProfitLoss := ToFixed(BackReturn - Result.Risk - BackSum);


(*
			layCommission = layCommission || 5;
			var backReturn = backOdds * backStake,
				backReturnSNR = (backOdds - 1) * backStake,
				layCommissionPc = layCommission / 100,

			if (layOdds > 0) {
			 	// Lay stake, convert to fixed immediately to match betfair's numbers
				result.layStake = backReturn / (layOdds - layCommissionPc);
				result.layStake = result.layStake.toFixed(2);
				result.freeBet.layStake = backReturnSNR / (layOdds - layCommissionPc);
				result.freeBet.layStake = result.freeBet.layStake.toFixed(2);

				// Lay risk (liability)
				result.liability = result.layStake * (layOdds - 1);
				result.freeBet.liability = result.freeBet.layStake * (layOdds - 1);

				// Profit/Loss
				result.profit = backReturn - result.liability - backStake;
				result.freeBet.backProfit = backReturnSNR - result.freeBet.liability;
				result.freeBet.layProfit = result.freeBet.layStake * (1 - layCommissionPc);

				// Convert to fixed point
				//result.layStake = result.layStake.toFixed(2);
				result.liability = result.liability.toFixed(2);
				result.profit = result.profit.toFixed(2);

				//result.freeBet.layStake = result.freeBet.layStake.toFixed(2);
				result.freeBet.liability = result.freeBet.liability.toFixed(2);
				result.freeBet.backProfit = result.freeBet.backProfit.toFixed(2);
				result.freeBet.layProfit = result.freeBet.layProfit.toFixed(2);
			} else {
				result.profit = -100;
			}

			return result;
		}

*)
end;

procedure TForm1.colProfitLoVssStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if ARecord.Index = LayOddsDepth then
    GridViewStylesGetContentStyle(Sender, ARecord, AItem, AStyle)
  else
    SelectStyle(ARecord, stContentRed, stContentNormal, stContentGreen, AStyle);
end;

procedure TForm1.editBackOddsEditing(Sender: TObject; var CanEdit: Boolean);
begin
  Recalc;
end;

procedure TForm1.editBackOddsPropertiesChange(Sender: TObject);
begin
  Recalc;
end;

procedure TForm1.editLayOddsPropertiesChange(Sender: TObject);
begin
  editLayOdds.Properties.Increment := GetStep(editLayOdds.Value);
  Recalc;
end;

procedure TForm1.GridViewCellClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
    TShiftState; var AHandled: Boolean);
var
  Odds, Stake, Risk: Double;
begin
  Odds := GetValue(ACellViewInfo.GridRecord, colLayOdds.Index);
  Stake := GetValue(ACellViewInfo.GridRecord, colStake.Index);
  Risk := GetValue(ACellViewInfo.GridRecord, colRisk.Index);
  Clipboard.AsText := FloatToStr(Stake);
  UpdateSummary;
end;

procedure TForm1.GridViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  Value: Double;
begin
  if ARecord.Index = LayOddsDepth then
  begin
    SelectStyle(ARecord, stCenterRed, stCenterRow, stCenterGreen, AStyle);
  end;
end;

procedure TForm1.Recalc;
var
  CalcResult: TResult;
  BackStake: Integer;
  I: Integer;
  LayOdds, CalcLayOdds, Step: Double;
begin
  if FStake = 0 then
    BackStake := editStake.Value
  else
    BackStake := FStake;

//  GridView.DataController.RecordCount := 0;
  GridView.BeginUpdate;
  try
    GridView.DataController.RecordCount := LayOddsDepth * 2 + 1;
    LayOdds := editLayOdds.Value;
    Step := GetStep(LayOdds);
    for I := 0 to LayOddsDepth * 2 do
    begin
      CalcLayOdds := LayOdds + (I - LayOddsDepth) * Step;
      CalcResult := Calc(FMode, editBackOdds.Value, CalcLayOdds, BackStake, FComm);
      with GridView.DataController do
      begin
        Values[I, colLayOdds.Index] := CalcLayOdds;
        Values[I, colProfitLoss.Index] := CalcResult.ProfitLoss;
        Values[I, colStake.Index] := CalcResult.LayStake;
        Values[I, colRisk.Index] := CalcResult.Risk;
      end;
    end;
  finally
    GridView.EndUpdate;
  end;
  UpdateSummary;
end;

procedure TForm1.SelectStyle(Rec: TcxCustomGridRecord; Red, Zero, Green: TcxStyle; var Style: TcxStyle);
var
  Value: Double;
begin
  Value := GetProfitLoss(Rec);
  if Value > 0 then
    Style := Green
  else if Value < 0 then
    Style := Red
  else if Zero <> nil then
    Style := Zero;
end;

procedure TForm1.UpdateSummary;
var
  Odds, Stake, Risk: Double;
  Rec: TcxCustomGridRecord;
begin
  if GridView.Controller.SelectedRecordCount > 0 then
  begin
    Rec := GridView.Controller.SelectedRecords[0];
    Odds := GetValue(Rec, colLayOdds.Index);
    Stake := GetValue(Rec, colStake.Index);
    Risk := GetValue(Rec, colRisk.Index);
    panelSummary.Caption := Format('Laying %.2f @ %.2f, liability %.2f, commission %d%%',
      [Stake, Odds, Risk, FComm]);
    Clipboard.AsText := FloatToStr(Stake);
  end
  else
    panelSummary.Caption := 'Select a row';
end;

end.
