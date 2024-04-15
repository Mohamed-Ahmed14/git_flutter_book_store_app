abstract class ProfileState{}
class ProfileInitState extends ProfileState{}

class ShowProfLoadingState extends ProfileState{}
class ShowProfSuccessState extends ProfileState{}
class ShowProfErrorState extends ProfileState{}

class ChangeFormState extends ProfileState{}

class EditProfileLoadingState extends ProfileState{}
class EditProfileSuccessState extends ProfileState{}
class EditProfileErrorState extends ProfileState{}


class ChangePassLoadingState extends ProfileState{}
class ChangePassSuccessState extends ProfileState{}
class ChangePassErrorState extends ProfileState{}

class ChangeProfObscureSuccessState extends ProfileState{}

class LogoutLoadingState extends ProfileState{}
class LogoutSuccessState extends ProfileState{}
class LogoutErrorState extends ProfileState{}
