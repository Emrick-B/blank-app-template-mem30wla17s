import streamlit as st

st.title("🎈 Team event manager")
st.write(
    "Let's start building! For help and inspiration, head over to [docs.streamlit.io](https://docs.streamlit.io/)."
)
option = st.selectbox(
    "Qui recherches tu?",
    ("Personne 1","Personne 2", "Personne 3"))

