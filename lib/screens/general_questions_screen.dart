import 'package:flutter/material.dart';
import 'package:profertility/config/config.dart';
// import 'package:profertility/screens/questions_screen.dart';
import 'package:profertility/screens/widgets/primary_button.dart';

import 'profile_setup_screen.dart';

class GeneralQuestionsScreen extends StatefulWidget {
  const GeneralQuestionsScreen({super.key});

  @override
  State<GeneralQuestionsScreen> createState() => _GeneralQuestionsScreenState();
}

class _GeneralQuestionsScreenState extends State<GeneralQuestionsScreen> {
  bool showQuestions = false;
  bool birthQuestion = false;
  final fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Form(
                key: fkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Biological",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4d1a53),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    const NoteWidget(text: "General Questions"),
                    const SizedBox(height: 16),
                    InputFormField(
                      hint: "Enter your age in years",
                      title: "How old are you?",
                    ),
                    const SizedBox(height: 20),
                    SelectionFormField(
                      hint: "Select relationship status",
                      title: "Relationship Status",
                      options: const [
                        "Single",
                        "In a relationship",
                        "Married",
                        "Widowed",
                        "divorced",
                        "separated",
                        "registered civil partnership",
                      ],
                    ),
                    const SizedBox(height: 20),
                    InputFormField(
                      hint: "Enter input in cm",
                      title: "How tall are you?",
                      suffix: "Cm",
                    ),
                    const SizedBox(height: 20),
                    InputFormField(
                      title: "How much do you weigh today?",
                      hint: "Enter input in kg",
                      suffix: "Kg",
                    ),
                    const SizedBox(height: 20),
                    InputFormField(
                      title: "How much did you weight a year ago?",
                      hint: "Enter input in kg",
                      suffix: "Kg",
                    ),
                    const SizedBox(height: 20),
                    ToggleFormField(
                      title: "Which sex is your partner?",
                      option1: "Male",
                      option2: "Female",
                    ),
                    const SizedBox(height: 8),
                    InputFormField(
                      title: "How old is your partner",
                      hint: "Enter your partner age in years",
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      min: 1,
                      max: 8,
                      division: 7,
                      label: (value) {
                        if (value > 7) {
                          return "$value+ years";
                        }
                        return "$value years";
                      },
                      title:
                          "How long have you and your partner been in a relationship?",
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "1 year",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "8+ years",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const NoteWidget(text: "Your current circumstances"),
                    const SizedBox(height: 16),
                    ToggleFormField(
                      title: "Are you currently actively trying to conceive?",
                      onChange: (value) {
                        setState(() {
                          showQuestions = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    if (showQuestions)
                      Column(
                        children: [
                          InputFormField(
                            hint: "Months...",
                            keyboardType: TextInputType.number,
                            title: "How long have you been trying to conceive "
                                "(Number of months having regular, unprotected sexual intercourse)",
                          ),
                          const SizedBox(height: 20),
                          SelectionFormField<String>(
                            hint: "Select",
                            textfieldHint: "Describe:",
                            title: "Who took the initiative to the decision "
                                "that you should try to get pregnant?",
                            requireTextField: (value) {
                              if (value != null) {
                                return value
                                    .contains("Another person or persons");
                              }
                              return false;
                            },
                            options: const [
                              "Just me",
                              "Mostly me",
                              "My partner and I equally",
                              "Just my partner",
                              "Mostly my partner",
                              "Another person or persons",
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    SliderFormField(
                      min: 1,
                      max: 8,
                      division: 7,
                      label: (value) {
                        if (value > 7) {
                          return "$value+ times/w";
                        }
                        return "$value times/w";
                      },
                      title: "How many times a week on average do you "
                          "have vaginal intercourse? (Round up or down)",
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 80,
                            child: Text(
                              "Fewer than 1 times/w",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff1d1d1d),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              "8 or more times/w",
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff1d1d1d),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SelectionFormField<String>(
                      hint: "Select...",
                      title:
                          "How satisfied or dissatisfied are you with your sex life?",
                      options: const [
                        "Very dissatisfied",
                        "Quite dissatisfied",
                        "Neither satisfied nor dissatisfied",
                        "Quite satisfied",
                        "Very satisfied",
                      ],
                    ),
                    const SizedBox(height: 20),
                    const NoteWidget(text: "Menstrual cycle"),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        const Text(
                          "When was the first day of your last period? "
                          "(If you can't remember the exact date, "
                          "please give simply the year and month)",
                          style: TextStyle(
                            color: Color(0xff1d1d1d),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DateTimeFormField(
                          context: context,
                          hint: "Select Last Menstrual Date",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ToggleFormField(title: "Is your menstrual cycle regular"),
                    const SizedBox(height: 8),
                    InputFormField(
                      hint: "Enter menstrual cycle details",
                      title: "How long is your normal menstrual cycle? "
                          "(A menstrual cycle is the time between "
                          "the first day of one period and the first "
                          "day of the next)",
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      title: "Typically, what is your menstrual cycle flow?",
                      min: 1,
                      max: 3,
                      division: 2,
                      label: (value) {
                        switch (value) {
                          case 1:
                            return "Heavy";
                          case 2:
                            return "Light";
                          case 3:
                            return "Normal";
                          default:
                            return "Heavy";
                        }
                      },
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Heavy",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "Light",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "Normal",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SelectionFormField(
                      title:
                          "How much menstrual pain did you have with your most recent period?",
                      options: const [
                        "Severe pain",
                        "Quite bad pain",
                        "Neither severe nor insignificant pain",
                        "Mild pain",
                        "Hardly any pain",
                      ],
                      hint: "Select...",
                    ),
                    const SizedBox(height: 20),
                    InputFormField(
                      hint: "Enter your age",
                      title:
                          "How old were you when you had your first menstruation?",
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 8,
                      children: Config.healthAndGynae
                          .map(
                            (e) => ToggleFormField(title: e),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    SelectionFormField(
                      title: "How is your general health just now?",
                      options: const [
                        "Very good",
                        "Quite good",
                        "Neither good nor bad",
                        "Quite bad",
                        "Very bad",
                      ],
                      hint: "Select...",
                    ),
                    const SizedBox(height: 20),
                    const NoteWidget(text: "Genetic Predispositions"),
                    const SizedBox(height: 16),
                    InputFormField(
                      hint: "Enter details",
                      title:
                          "How old was your mother when she reached menopause",
                    ),
                    const SizedBox(height: 20),
                    const NoteWidget(text: "Previous Pregnancies"),
                    const SizedBox(height: 16),
                    ToggleFormField(
                      title: "Have you ever been pregnant "
                          "(include miscarriages and abortions)?",
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      title: "How many times have you been pregnant "
                          "(include miscarriages and abortions)?",
                      min: 0,
                      max: 9,
                      division: 8,
                      label: (value) {
                        if (value > 8) {
                          return "$value+ times";
                        }
                        return "$value times";
                      },
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0 times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "9+ times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InputFormField(
                      hint: "Enter age in years",
                      title: "How old were you when you became pregnant "
                          "for the first time (include miscarriages "
                          "and abortions)?",
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      title: "How many times have you had a "
                          "miscarriage in months 0-6?",
                      min: 0,
                      max: 6,
                      division: 6,
                      label: (value) {
                        if (value > 5) {
                          return "$value+ times";
                        }
                        return "$value times";
                      },
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0 times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "6+ times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      title: "How many times have you had an abortion?",
                      min: 0,
                      max: 6,
                      division: 6,
                      label: (value) {
                        if (value > 5) {
                          return "$value+ times";
                        }
                        return "$value times";
                      },
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0 times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "6+ times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SliderFormField(
                      title:
                          "How many times have you had an ectopic pregnancy?",
                      min: 0,
                      max: 6,
                      division: 6,
                      label: (value) {
                        if (value > 5) {
                          return "$value+ times";
                        }
                        return "$value times";
                      },
                      labelWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0 times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "6+ times",
                            style: TextStyle(
                              color: Color(0xff1d1d1d),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ToggleFormField(
                      title: "Have you ever given birth to a child?",
                      onChange: (value) {
                        setState(() {
                          birthQuestion = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    if (birthQuestion)
                      Wrap(
                        runSpacing: 20,
                        children: Config.previousPregnancies
                            .map(
                              (e) => SliderFormField(
                                title: e,
                                min: 0,
                                max: 5,
                                division: 5,
                                label: (value) {
                                  if (value > 4) {
                                    return "$value+";
                                  }
                                  return "$value";
                                },
                                labelWidget: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "0 ",
                                      style: TextStyle(
                                        color: Color(0xff1d1d1d),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "5 or more",
                                      style: TextStyle(
                                        color: Color(0xff1d1d1d),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: PrimaryButton(
                        title: "Continue",
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const QuestionsScreen(),
                          //   ),
                          // );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final String text;
  const NoteWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800]!,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class InputFormField extends FormField<String> {
  final String title;
  final String hint;
  final String? suffix;
  final TextInputType? keyboardType;

  InputFormField({
    super.key,
    required this.hint,
    required this.title,
    this.suffix,
    this.keyboardType,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? initialValue,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<String?> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1d1d1d),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  onSaved: onSaved,
                  validator: validator,
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hint,
                    suffixIcon: suffix == null
                        ? null
                        : Text(
                            suffix,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff4d1a53),
                            ),
                          ),
                    isDense: true,
                    suffixIconConstraints: suffix == null
                        ? null
                        : const BoxConstraints(
                            minHeight: 0,
                            minWidth: 45,
                          ),
                  ),
                ),
              ],
            );
          },
        );
}

class SliderFormField extends FormField<double> {
  final String title;
  final double min;
  final double max;
  final int division;
  final String Function(int value) label;
  final Widget labelWidget;

  SliderFormField({
    super.key,
    required this.title,
    required this.min,
    required this.max,
    required this.division,
    required this.label,
    required this.labelWidget,
    FormFieldSetter<double>? onSaved,
    FormFieldValidator<double>? validator,
    double? initialValue,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<double?> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1d1d1d),
                  ),
                ),
                const SizedBox(height: 6),
                SliderTheme(
                  data: const SliderThemeData(),
                  child: Slider(
                    max: max,
                    min: min,
                    divisions: division,
                    label: label(state.value?.toInt() ?? min.toInt()),
                    value: state.value ?? min,
                    inactiveColor: const Color(0xfff7f8fa),
                    onChanged: (v) {
                      state.didChange(v);
                    },
                  ),
                ),
                labelWidget
              ],
            );
          },
        );
}

class SelectionFormField<T> extends FormField<T> {
  final String title;
  final List<T> options;
  final String? textfieldHint;
  final bool Function(T? value)? requireTextField;
  final String hint;

  SelectionFormField({
    super.key,
    required this.title,
    required this.options,
    required this.hint,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    this.textfieldHint,
    this.requireTextField,
    T? initialValue,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<T> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1d1d1d),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: DropdownButtonFormField<T>(
                    validator: validator,
                    onSaved: onSaved,
                    value: initialValue,
                    isDense: true,
                    isExpanded: true,
                    icon: Image.asset("assets/images/Polygon.png"),
                    hint: Text(hint),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(18.0),
                    ),
                    items: options
                        .map(
                          (e) => DropdownMenuItem<T>(
                            value: e,
                            child: Text(
                              e.toString(),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (T? value) {
                      state.didChange(value);
                    },
                  ),
                ),
                if (requireTextField != null && requireTextField(state.value))
                  Column(
                    children: [
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: textfieldHint,
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        );
}

class ToggleFormField extends FormField<bool> {
  final String title;
  final String? option1;
  final String? option2;
  final void Function(bool value)? onChange;

  ToggleFormField({
    super.key,
    required this.title,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    this.option1,
    this.option2,
    bool? initialValue,
    this.onChange,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<bool?> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1d1d1d),
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        state.didChange(true);
                        state.validate();
                        if (onChange != null) {
                          onChange(true);
                        }
                      },
                      icon: Radio(
                        value: true,
                        groupValue: state.value,
                        onChanged: (value) {
                          state.didChange(value);
                          state.validate();
                          if (onChange != null) {
                            onChange(true);
                          }
                        },
                      ),
                      label: Text(option1 ?? "Yes"),
                    ),
                    const SizedBox(width: 24),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        state.didChange(false);
                        state.validate();
                        if (onChange != null) {
                          onChange(false);
                        }
                      },
                      icon: Radio(
                        value: false,
                        groupValue: state.value,
                        onChanged: (value) {
                          state.didChange(value);
                          state.validate();
                          if (onChange != null) {
                            onChange(false);
                          }
                        },
                      ),
                      label: Text(option2 ?? "No"),
                    ),
                  ],
                )
              ],
            );
          },
        );
}
