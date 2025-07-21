typedef DialogAction = void Function();

class BaseAction {}

class NavigationAction extends BaseAction {
  String route;
  NavigationAction(this.route);
}
class ShowMessageAction extends BaseAction{
  String message;
  DialogAction? onDismiss;
  DialogAction? onPosAction;
  DialogAction? onNegativeAction;
  ShowMessageAction(this.message);
}
class ShowLoadingDialogAction extends BaseAction{
 String? message;
 bool dismissible;
 DialogAction? onDismiss;
 ShowLoadingDialogAction({required this.message,
   this.dismissible = true, this.onDismiss});
}

class BaseState{
  BaseAction? action;
}