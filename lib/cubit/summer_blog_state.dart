// ignore_for_file: prefer_const_constructors_in_immutables

part of 'summer_blog_cubit.dart';

abstract class SummerBlogState extends Equatable {
  const SummerBlogState();

  @override
  List<Object?> get props => [];
}

class SummerBlogInitial extends SummerBlogState {}

class SummerBlogLoading extends SummerBlogState {}

class SummerBlogSucces extends SummerBlogState{
  final List<SummerBlogModel> summerBlogs;

  SummerBlogSucces(this.summerBlogs);

  @override
  List<Object?> get props => [summerBlogs];
}

class SummerBlogFailed extends SummerBlogState{
  final String error;

  SummerBlogFailed(this.error);

  @override
  List<Object?> get props => [error];
}
