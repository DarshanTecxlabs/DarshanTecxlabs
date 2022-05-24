abstract class SearchEvent {}

class LoadSearch extends SearchEvent{}

class SearchChange extends SearchEvent{
  final String sSearchText;

  SearchChange(this.sSearchText);  
}

class OnSearchResult extends SearchEvent{}

class OnSearchError extends SearchEvent{}
