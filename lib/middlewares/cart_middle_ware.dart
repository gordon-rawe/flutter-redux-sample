

final cartMiddleWare = (store, action, next) {
  print("intercept $action");
  next();
};
