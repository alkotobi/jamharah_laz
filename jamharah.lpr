program jamharah;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  sysutils,Interfaces, // this includes the LCL widgetset
  Forms, virtualdbtreeexlaz, umain, db_design, udb_basic, udb_types, ujson,
  udtm, liteprovider10, unidac10
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tdtm, dtm);
  if not FileExists(make_db_path(jamharah_db_name)) then
  begin
     db_create_from_mndatabase(dtm.conn,db_def);
  end
  else
  begin
    db_update_from_mndatabse(dtm.conn,db_def);
  end;
  //Application.CreateForm(Tfrm_main, frm_main);
  frm_main_create();
  frm_main.Show;
  Application.Run;
end.

