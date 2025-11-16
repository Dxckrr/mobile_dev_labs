  double evaluateExpresion(String expr) {
    List<String> operators = ["+", "-", "*", "/"];

    for (var op in operators) {
      if (expr.contains(op)) {
        List<String> operatoresObtained = expr.split(op);

        if (operatoresObtained.length == 2) {
          double n1 = double.parse(operatoresObtained[0]);
          double n2 = double.parse(operatoresObtained[1]);

          switch (op) {
            case "+":
              return n1 + n2;
            case "-":
              return n1 - n2;
            case "*":
              return n1 * n2;
            case "/":
              return n1 / n2;
          }
        }
      }
    }

    throw Exception("Expresión no válida");
  }