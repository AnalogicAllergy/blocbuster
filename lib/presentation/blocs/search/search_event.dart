part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class SearchTermChangedEvent extends SearchEvent {
  final String searchTerm;

  SearchTermChangedEvent({this.searchTerm});

  @override
  // TODO: implement props
  List<Object> get props => [searchTerm];
  @override
  // TODO: implement stringify
  bool get stringify => true;
}
