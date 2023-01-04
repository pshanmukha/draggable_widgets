import 'package:flutter/material.dart';

class DraggableWidgetScreen extends StatefulWidget {
  const DraggableWidgetScreen({Key? key}) : super(key: key);

  @override
  _DraggableWidgetScreenState createState() => _DraggableWidgetScreenState();
}

class _DraggableWidgetScreenState extends State<DraggableWidgetScreen> {
  Color caughtColor = Colors.orangeAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Draggable(
                data: Colors.orangeAccent,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.orange,
                  child: const Center(
                    child: Text("Drag this"),
                  ),

                ),
                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.orangeAccent.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                        "Dragging...",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),),
              DragTarget(
                  onAccept: (Color color) {
                    caughtColor = color;
                  },
                  builder: (
                      BuildContext context,
                      List<dynamic> accept,
                      List<dynamic> reject,
                      ){
                    return Container(
                      width: 200,
                      height: 200,
                      color: accept.isEmpty ? caughtColor : Colors.grey.shade200,
                      child: const Center(
                        child: Text("Drag here"),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
