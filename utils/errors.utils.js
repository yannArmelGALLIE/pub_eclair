module.exports.signUpClientErrors = (err) => {
    let errors = { lastName: '', firstname: '', email: '', phoneNumber: '', password: ''}

    if(err.message.includes('lastName')) {
        errors.lastName = "Nom incorrect";
    }
    if(err.message.includes('firstname')) {
        errors.firstname = "Prenoms incorrects";
    }
    if(err.message.includes('email')) {
        errors.email = "Email incorrect";
    }
    if(err.message.includes('password')) {
        errors.password = "Le mot de passe doit faire 6 caractères minimum";
    }

    if(err.code === 11000 && Object.keys(err.keyValue)[0].includes('name')) {
        errors.lastName = 'Ce nom est déjà pris'; 
    }
    if(err.code === 11000 && Object.keys(err.keyValue)[0].includes('email')) {
        errors.email = 'Cet email est déjà enregistré'; 
    }

    return errors
};

module.exports.signInErrors = (err) => {
    let errors = { email: '', password: ''}

    if (err.message.includes('email')) {
        errors.email = "Email inconnu";
    }

    if (err.message.includes('password')) {
        errors.password = "Password incorrect";
    }

    return errors
}

module.exports.uploadErrors = (err) => {
    let errors = { format: '', maxSize: ""};

    if (err.message.includes('invalid file')){
        return errors.format = "Format incompatible";
    }
    if (err.message.includes('max size')) {
        return errors.maxSize = "Le fichier dépasse 500ko";
    }
    return errors
}