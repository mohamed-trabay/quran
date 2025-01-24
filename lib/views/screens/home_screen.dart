import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/ayat_cubit.dart';
import '../../cubits/ayat_state.dart';
import 'Ayat Screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('القرآن الكريم')),
      body: BlocBuilder<AyatCubit, AyatState>(
        builder: (context, state) {
          if (state is AyatInitial) {
            context.read<AyatCubit>().loadAyat();
            return Center(child: CircularProgressIndicator());
          } else if (state is AyatLoaded) {
            return ListView.builder(
              itemCount: state.sourList.length,
              itemBuilder: (context, index) {
                final surah = state.sourList[index];
                return ListTile(
                  title: Text(surah.name),
                  subtitle: Text('عدد الآيات: ${surah.ayat}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AyatScreen(surah: surah),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is AyatError) {
            return Center(child: Text('حدث خطأ: ${state.error}'));
          }
          return Center(child: Text('لا توجد بيانات'));
        },
      ),
    );
  }
}
