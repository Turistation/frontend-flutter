import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:touristation/model/summer_blog_model.dart';
import 'package:touristation/services/summer_blog_services.dart';

part 'summer_blog_state.dart';

class SummerBlogCubit extends Cubit<SummerBlogState> {
  SummerBlogCubit() : super(SummerBlogInitial());

  void fetchSummerBlog() async {
    
    try {
      emit(SummerBlogLoading());
      List<SummerBlogModel> summerBlog = await SummerBlogServices().fetchSummerBlog();
      emit(SummerBlogSucces(summerBlog));
    } catch (e) {
      emit(SummerBlogFailed(e.toString()));
    }
  }

}
