document.addEventListener('DOMContentLoaded', function(){
  const userForm = document.getElementById('new-user');
  const avatarList = document.getElementById('user-avatar');
  if (!userForm) return null;

  const fileField = document.querySelector('input[type="file"][name="user[avatar_image]"]');
  fileField.addEventListener('change', function(e){
    const alreadyAvatar = document.querySelector('.avatar');
    if (alreadyAvatar) {
      alreadyAvatar.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const avatarWrapper = document.createElement('div');
    avatarWrapper.setAttribute('class', 'avatar');
    const avatarImage = document.createElement('img');
    avatarImage.setAttribute('class', 'avatar-image');
    avatarImage.setAttribute('src', blob);

    avatarWrapper.appendChild(avatarImage);
    avatarList.appendChild(avatarWrapper);
  });
});